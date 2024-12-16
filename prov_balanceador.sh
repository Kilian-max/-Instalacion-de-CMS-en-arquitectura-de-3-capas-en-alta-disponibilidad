# Actualizar los repositorios
apt-get update && apt-get upgrade -y

# Instalar Nginx
apt-get install nginx -y

# Instalar los módulos necesarios de Nginx (si es necesario)
apt-get install -y nginx-extras

# Configuración del balanceador de carga
cat <<EOL > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name kilianowncloud.duckdns.org;

    # Configuración del balanceador
    location / {
        proxy_pass http://backend;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;
}

upstream backend {
    server 192.168.56.11;
    server 192.168.56.12;
}
EOL

# Reiniciar Nginx para aplicar la configuración
systemctl restart nginx

# Instalar Certbot y configurar SSL para Nginx
apt-get install certbot python3-certbot-nginx -y
certbot --nginx -d kilianowncloud.duckdns.org --non-interactive --agree-tos -m kgimenezb01@educarex.es

# Comprobar el estado del servicio Nginx
systemctl status nginx