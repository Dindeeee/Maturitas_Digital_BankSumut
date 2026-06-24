#!/bin/bash
# deploy.sh — Skrip deploy ke VPS
# Server: 103.93.134.128 | Domain: maturitasdigital.site
set -e

DOMAIN="maturitasdigital.site"
ICH_NGINX="ich-pendidikan-nginx-1"
BANKSUMUT_NET="maturitas_digital_banksumut_banksumut_net"
ICH_NGINX_CONF="/var/www/ICH-Pendidikan/docker/nginx/default.conf"

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

# --- Generate APP_KEY jika kosong (sebelum container naik) ---
APP_KEY_VAL=$(grep "^APP_KEY=" .env | cut -d= -f2)
if [ -z "$APP_KEY_VAL" ]; then
    echo -e "${YELLOW}Membuat APP_KEY...${NC}"
    NEW_KEY="base64:$(openssl rand -base64 32)"
    sed -i "s|^APP_KEY=$|APP_KEY=${NEW_KEY}|" .env
    echo -e "${GREEN}APP_KEY berhasil dibuat.${NC}"
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

# --- Siapkan storage/framework dirs ---
echo -e "${YELLOW}Menyiapkan direktori storage...${NC}"
docker compose exec app bash -c "mkdir -p /var/www/storage/framework/{cache,sessions,views} && chown -R www-data:www-data /var/www/storage/framework"

# --- Salin hasil build Vite ke volume public_build ---
echo -e "${YELLOW}Menyalin aset frontend ke volume...${NC}"
docker cp banksumut_app:/var/www/public/build/. "$(pwd)/public/build/" 2>/dev/null || true
docker cp "$(pwd)/public/build/." banksumut_app:/var/www/public/build/ 2>/dev/null || true

# --- Migrasi dan seed database ---
echo -e "${YELLOW}Menjalankan migrasi dan seeder...${NC}"
docker compose exec app php artisan migrate --force
docker compose exec app php artisan db:seed --class=MasterDataSeeder --force
docker compose exec app php artisan db:seed --class=UserSeeder --force
docker compose exec app php artisan db:seed --class=AssessmentImportSeeder --force

# --- Optimasi produksi ---
echo -e "${YELLOW}Mengoptimasi aplikasi...${NC}"
docker compose exec app php artisan config:clear
docker compose exec app php artisan view:cache
docker compose exec app php artisan config:cache
docker compose exec app php artisan route:cache

# --- Sambungkan nginx ich-pendidikan ke network banksumut ---
echo -e "${YELLOW}Menyambungkan nginx ke network banksumut...${NC}"
if docker inspect "$ICH_NGINX" &>/dev/null; then
    # Tambahkan server block jika belum ada
    if ! grep -q "maturitasdigital.site" "$ICH_NGINX_CONF" 2>/dev/null; then
        cat >> "$ICH_NGINX_CONF" << 'NGINX_EOF'

# ── BankSumut: maturitasdigital.site ─────────────────────────────────────────
server {
    listen 80;
    server_name maturitasdigital.site www.maturitasdigital.site;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        proxy_pass http://banksumut_nginx:80;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 300;
        proxy_connect_timeout 300;
    }

    client_max_body_size 20M;
}
NGINX_EOF
        echo -e "${GREEN}Server block maturitasdigital.site ditambahkan.${NC}"
    fi

    # Hubungkan ke network banksumut (abaikan jika sudah terhubung)
    docker network connect "$BANKSUMUT_NET" "$ICH_NGINX" 2>/dev/null \
        && echo -e "${GREEN}Network berhasil disambungkan.${NC}" \
        || echo -e "${YELLOW}Network sudah terhubung sebelumnya.${NC}"

    # Reload nginx
    docker exec "$ICH_NGINX" nginx -t \
        && docker exec "$ICH_NGINX" nginx -s reload \
        && echo -e "${GREEN}Nginx ich-pendidikan berhasil di-reload.${NC}"
else
    echo -e "${YELLOW}Container $ICH_NGINX tidak ditemukan — lewati langkah ini.${NC}"
fi

# --- Upload file logo (penting!) ---
echo ""
echo -e "${YELLOW}=== LANGKAH MANUAL: Upload file logo ===${NC}"
echo "File logo Bank Sumut tidak ada di repository (git-ignored)."
echo "Upload dari komputer lokal ke server ini dengan:"
echo ""
echo "  docker cp bank-sumut-logo.png banksumut_app:/var/www/storage/app/public/images/"
echo "  docker cp icon_bank_sumut.png  banksumut_app:/var/www/storage/app/public/images/"
echo ""

echo -e "${GREEN}=== Deploy HTTP berhasil! ===${NC}"
echo ""
echo "Aplikasi sekarang berjalan di: http://$DOMAIN"
echo ""
echo -e "${BOLD}Langkah selanjutnya — aktifkan HTTPS:${NC}"
echo "  chmod +x ssl-init.sh && ./ssl-init.sh"
echo ""
