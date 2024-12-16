# Actualizar los repositorios y el sistema
apt-get update && apt-get upgrade -y

# Instalar Nginx y las dependencias necesarias
apt-get install nginx nfs-common -y
apt-get install php7.4-zip php7.4-fpm php7.4-dom php7.4-xml php7.4-intl php7.4-mbstring php7.4-gd php7.4-curl php7.4-simplexml php7.4-mysql -y

# Montar el directorio compartido desde el servidor NFS
mkdir -p /var/www/owncloud
echo "192.168.56.13:/var/www/owncloud /var/www/owncloud nfs defaults 0 0" >> /etc/fstab
mount -a

# Configurar Nginx para servir el contenido
cat <<EOL > /etc/nginx/sites-available/default
server {
    listen 80;

    root /var/www/owncloud;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;  # Ajusta la versión de PHP si es necesario
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}
EOL

# Reiniciar Nginx para aplicar los cambios
systemctl restart nginx