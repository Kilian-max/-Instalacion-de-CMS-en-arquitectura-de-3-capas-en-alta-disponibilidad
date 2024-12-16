# Actualizar los repositorios y el sistema e intalamos mariadb
apt-get update
apt-get install -y mariadb-server

# Configuración de la base de datos
mysql -u root <<EOF 
CREATE DATABASE cloud_db;
CREATE USER 'KilianG'@'192.168.%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON cloud_db.* TO 'KilianG'@'192.168.%';
FLUSH PRIVILEGES;
EOF

# Configurar MariaDB para acceso remoto
sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb