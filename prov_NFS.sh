# Actualizar los repositorios y los paquetes del sistema
apt-get update && apt-get upgrade -y

# Instalar los paquetes necesarios para NFS, PHP y otras dependencias de OwnCloud
apt-get install -y nfs-kernel-server unzip php7.4-intl php7.4-bcmath php7.4 php7.4-fpm php7.4-mbstring php7.4-xml php7.4-curl php7.4-zip php7.4-gd php7.4-mysql

# Descargar la última versión de OwnCloud desde su sitio oficial
wget https://download.owncloud.com/server/stable/owncloud-latest.zip

# Crear el directorio donde se almacenará el contenido de OwnCloud
mkdir -p /var/www/

# Descomprimir el archivo descargado en el directorio /var/www/
unzip owncloud-latest.zip -d /var/www/

# Cambiar la propiedad del directorio de OwnCloud a www-data
chown -R www-data:www-data /var/www/owncloud

# Cambiar los permisos del directorio de OwnCloud
chmod -R 755 /var/www/owncloud

# Configurar el servidor NFS para compartir el directorio de OwnCloud entre las máquinas
echo "/var/www/owncloud 192.168.56.11(rw,sync,no_subtree_check,no_root_squash) 192.168.56.12(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports

# Configurar el fichero para el login del Owncloud
cat <<EOF > /var/www/owncloud/config/autoconfig.php
<?php
\$AUTOCONFIG = array(
  "dbtype" => "mysql",
  "dbname" => "cloud_db",
  "dbuser" => "KilianG",
  "dbpassword" => "1234",
  "dbhost" => "192.168.57.14",
  "directory" => "/var/www/owncloud/data",
  "adminlogin" => "admin",
  "adminpass" => "1234"
);
EOF

# Volver a exportar los directorios NFS para aplicar la configuración
exportfs -a

# Reiniciar el servicio NFS para que los cambios surtan efecto
systemctl restart nfs-kernel-server

# Cambiar la configuración de PHP-FPM para que escuche en todas las interfaces en el puerto 9000
sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Reiniciar PHP-FPM para aplicar los cambios realizados
systemctl restart php7.4-fpm
