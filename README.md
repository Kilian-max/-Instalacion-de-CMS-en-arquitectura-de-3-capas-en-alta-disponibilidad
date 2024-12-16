# Instalación de CMS en Arquitectura de 3 Capas en Alta Disponibilidad

## Índice

1. [Introducción](#introducción)
   - [Objetivo del Proyecto](#objetivo-del-proyecto)  
   - [Direccionamiento IP](#direccionamiento-ip)

2. [Instalación y Configuración](#instalación-y-configuración)
   - [Instalación de Vagrant y VirtualBox](#instalación-de-vagrant-y-virtualbox)  
   - [Aprovisionamiento de Máquinas Virtuales con Vagrant](#aprovisionamiento-de-máquinas-virtuales-con-vagrant)  
   - [Configuración del Balanceador de Carga](#configuración-del-balanceador-de-carga)  
   - [Configuración de Servidores Web (Nginx)](#configuración-de-servidores-web-nginx)  
   - [Configuración del Servidor NFS y PHP-FPM](#configuración-del-servidor-nfs-y-php-fpm)  
   - [Configuración de la Base de Datos MariaDB](#configuración-de-la-base-de-datos-mariadb)  
   - [Configuración del CMS (OwnCloud o Joomla)](#configuración-del-cms-owncloud-o-joomla)  
   - [Configuración de SSL](#configuración-de-ssl)

3. [Pruebas y Verificación](#pruebas-y-verificación)

4. [Visualización de la Aplicación en Funcionamiento](#visualización-de-la-aplicación-en-funcionamiento)  

5. [Errores Comunes y Soluciones](#errores-comunes-y-soluciones)

---

## 1. Introducción
La clase de ASIR 2º hemos tenido que hacer un CMS de 3 capas:
- **Capa 1**: Balanceador  
- **Capa 2**: 2 Servidores de BackEnds y un NFS  
- **Capa 3**: Base de datos (Mariadb)

### Objetivo del Proyecto
Acceder al balanceador con una IP pública, que este distribuya las peticiones de los usuarios entre los 2 backends, que en NFS les está compartiendo la carpeta con el OwnCloud y que accedan a la información de la base de datos para logearte al OwnCloud.

### Direccionamiento IP

**Balanceador**  
IP pública capa 1: `192.168.x.x`  
IP privada capa 2: `192.168.56.10`  

**WEB1**  
IP privada capa 2: `192.168.56.11`  

**WEB2**  
IP privada capa 2: `192.168.56.12`  

**NFS**  
IP privada capa 2: `192.168.56.13`  

**Base de Datos**  
IP privada capa 3: `192.168.57.14`  
IP privada capa 2: `192.168.56.14`  

---

## 2. Instalación y Configuración
Editamos el Vagrantfile para crear la estructura de la prueba.

### Instalación de Vagrant y VirtualBox  
Pasos para instalar Vagrant y VirtualBox.

### Aprovisionamiento de Máquinas Virtuales con Vagrant  
Código para aprovisionar las máquinas virtuales.

### Configuración del Balanceador de Carga  
Pasos de configuración del balanceador Nginx.

### Configuración de Servidores Web (Nginx)  
Detalles sobre la configuración de Nginx en los servidores web.

### Configuración del Servidor NFS y PHP-FPM  
Configuración del servidor NFS y el motor PHP-FPM.

### Configuración de la Base de Datos MariaDB  
Instalación y configuración de la base de datos MariaDB.

### Configuración del CMS (OwnCloud o Joomla)  
Pasos para instalar y personalizar el CMS seleccionado.

### Configuración de SSL  
Instalación y configuración de un certificado SSL con Let's Encrypt.

---

## 3. Pruebas y Verificación
Una vez se hayan instalado todos los aprovisionamientos, comprobamos que todo vaya correctamente introduciendo el nombre del dominio o la IP en el navegador.

---

## 4. Visualización de la Aplicación en Funcionamiento
Incluye capturas de pantalla mostrando el funcionamiento de la aplicación.

---

## 5. Errores Comunes y Soluciones
Lo que más me ha costado ha sido poner el dominio en los servidores de backend, los errores que me daba eran relacionados con...
