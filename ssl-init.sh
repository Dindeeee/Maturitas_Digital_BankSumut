#!/bin/bash
# ssl-init.sh — Setup SSL Let's Encrypt (jalankan setelah deploy.sh berhasil)
# Prasyarat: domain maturitasdigital.site sudah pointing ke IP 103.93.134.128
set -e

DOMAIN="maturitasdigital.site"
EMAIL="alifa.qadri@gmail.com"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}=== Setup SSL Let's Encrypt untuk $DOMAIN ===${NC}"
echo ""

# --- Cek container nginx berjalan ---
if ! docker compose ps nginx | grep -q "running"; then
    echo -e "${RED}ERROR: Container nginx belum berjalan. Jalankan deploy.sh terlebih dahulu.${NC}"
    exit 1
fi

# --- Verifikasi DNS ---
echo -e "${YELLOW}Memeriksa DNS $DOMAIN...${NC}"
RESOLVED_IP=$(dig +short "$DOMAIN" 2>/dev/null | tail -1)
if [ "$RESOLVED_IP" != "103.93.134.128" ]; then
    echo -e "${RED}PERINGATAN: $DOMAIN belum pointing ke 103.93.134.128 (sekarang: ${RESOLVED_IP:-tidak ditemukan})${NC}"
    echo "Pastikan DNS sudah dikonfigurasi dan tunggu propagasi (bisa sampai 24 jam)."
    read -p "Lanjutkan tetap? (y/N): " confirm
    [[ "$confirm" =~ ^[Yy]$ ]] || exit 1
fi

# --- Request SSL certificate ---
echo -e "${YELLOW}Meminta SSL certificate dari Let's Encrypt...${NC}"
docker compose run --rm certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    --email "$EMAIL" \
    --agree-tos \
    --no-eff-email \
    -d "$DOMAIN" \
    -d "www.$DOMAIN"

# --- Ganti Nginx config ke HTTPS ---
echo -e "${YELLOW}Mengaktifkan konfigurasi HTTPS...${NC}"
cp docker/nginx/https.conf docker/nginx/default.conf

# --- Reload Nginx ---
echo -e "${YELLOW}Mereload Nginx...${NC}"
docker compose exec nginx nginx -t
docker compose exec nginx nginx -s reload

echo ""
echo -e "${GREEN}=== HTTPS berhasil diaktifkan! ===${NC}"
echo ""
echo "Aplikasi sekarang berjalan di: https://$DOMAIN"
echo ""
echo -e "${BOLD}Catatan:${NC}"
echo "  - Sertifikat SSL akan diperbarui otomatis oleh container certbot."
echo "  - Pastikan port 80 dan 443 terbuka di firewall server."
echo ""
