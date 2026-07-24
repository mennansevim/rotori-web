# nginx:alpine — statik HTML servisi için 7 MB'lık en hafif image.
# ARM64 (Raspberry Pi 5) native destekli.
FROM nginx:alpine

# Statik dosyalar.
COPY public/ /usr/share/nginx/html/

# nginx config — gzip + cache-control + SPA fallback.
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# nginx:alpine varsayılan CMD yeterli.
