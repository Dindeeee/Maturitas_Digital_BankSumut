#!/bin/bash
# deploy.sh — Skrip deploy pertama kali ke VPS
# Server: 103.93.134.128 | Domain: maturitasdigital.site
set -e

DOMAIN="maturitasdigital.site"
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}=== Deploy Assessment Maturitas Digital Bank Sumut ===${NC}"
echo ""

# --- Cek prasyarat ---
if ! command -v docker &>/dev/null; then
    echo -e "${RED}ERROR: Docker belum terinstal.${NC}"
    echo "Install Docker: https://docs.docker.com/engine/install/ubuntu/"
    exit 1
fi

if ! docker compose version &>/dev/null; then
    echo -e "${RED}ERROR: Docker Compose (plugin) belum terinstal.${NC}"
    exit 1
fi

# --- Cek .env ---
if [ ! -f .env ]; then
    if [ -f .env.production ]; then
        echo -e "${YELLOW}File .env tidak ditemukan. Menyalin dari .env.production...${NC}"
        cp .env.production .env
        echo -e "${RED}PENTING: Edit .env sekarang — ganti semua nilai GANTI_DENGAN_*${NC}"
        echo "Jalankan: nano .env"
        echo ""
        read -p "Tekan ENTER setelah selesai mengedit .env..."
    else
        echo -e "${RED}ERROR: File .env dan .env.production tidak ditemukan.${NC}"
        exit 1
    fi
fi

# Validasi .env tidak mengandung placeholder
if grep -q "GANTI_DENGAN" .env; then
    echo -e "${RED}ERROR: .env masih mengandung nilai placeholder. Edit dulu semua 'GANTI_DENGAN_*'.${NC}"
    exit 1
fi

# --- Siapkan Nginx config (HTTP dulu sebelum SSL) ---
echo -e "${YELLOW}Menyiapkan konfigurasi Nginx (HTTP)...${NC}"
cp docker/nginx/http.conf docker/nginx/default.conf

# --- Build & jalankan container ---
echo -e "${YELLOW}Membangun Docker image (ini bisa makan 5-10 menit pertama kali)...${NC}"
docker compose build --no-cache app

echo -e "${YELLOW}Menjalankan semua service...${NC}"
docker compose up -d

# --- Tunggu MySQL siap ---
echo -e "${YELLOW}Menunggu MySQL siap...${NC}"
until docker compose exec mysql mysqladmin ping -h localhost --silent 2>/dev/null; do
    echo -n "."
    sleep 3
done
echo ""

# --- Generate APP_KEY jika kosong ---
APP_KEY_VAL=$(grep "^APP_KEY=" .env | cut -d= -f2)
if [ -z "$APP_KEY_VAL" ]; then
    echo -e "${YELLOW}Membuat APP_KEY...${NC}"
    docker compose exec app php artisan key:generate --force
fi

# --- Migrasi dan seed database ---
echo -e "${YELLOW}Menjalankan migrasi dan seeder...${NC}"
docker compose exec app php artisan migrate --force
docker compose exec app php artisan db:seed --class=MasterDataSeeder --force
docker compose exec app php artisan db:seed --class=AssessmentImportSeeder --force

# --- Optimasi produksi ---
echo -e "${YELLOW}Mengoptimasi aplikasi...${NC}"
docker compose exec app php artisan config:cache
docker compose exec app php artisan route:cache
docker compose exec app php artisan view:cache

# --- Upload file logo (penting!) ---
echo ""
echo -e "${YELLOW}=== LANGKAH MANUAL: Upload file logo ===${NC}"
echo "File logo Bank Sumut tidak ada di repository (git-ignored)."
echo "Upload dari komputer lokal ke server ini dengan:"
echo ""
echo "  docker cp bank-sumut-logo.png banksumut_app:/var/www/storage/app/public/images/"
echo "  docker cp icon_bank_sumut.png  banksumut_app:/var/www/storage/app/public/images/"
echo ""
echo "Atau dari komputer lokal via SCP terlebih dahulu:"
echo "  scp storage/app/public/images/* root@103.93.134.128:/path/ke/project/storage-images/"
echo "  lalu jalankan docker cp dari server."
echo ""

echo -e "${GREEN}=== Deploy HTTP berhasil! ===${NC}"
echo ""
echo "Aplikasi sekarang berjalan di: http://$DOMAIN"
echo ""
echo -e "${BOLD}Langkah selanjutnya — aktifkan HTTPS:${NC}"
echo "  chmod +x ssl-init.sh && ./ssl-init.sh"
echo ""
