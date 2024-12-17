# Instalación de CMS en Arquitectura de 3 Capas en Alta Disponibilidad

## Índice

1. [Introducción](#1-introducción)
   - [Objetivo del Proyecto](#11-objetivo-del-proyecto)  
   - [Direccionamiento IP](#12-direccionamiento-ip)

2. [Instalación y Configuración](#2-instalación-y-configuración)
   - [Instalación de Vagrant y VirtualBox](#21-instalación-de-vagrant-y-virtualbox)   
   - [Configuración de Servidores Web (Nginx)](#22-configuración-de-servidores-web-nginx)  
   - [Configuración del Servidor NFS y PHP-FPM](#23-configuración-del-servidor-nfs-y-php-fpm)  
   - [Configuración de la Base de Datos MariaDB](#24-configuración-de-la-base-de-datos-mariadb)  
   - [Configuración del CMS (OwnCloud o Joomla)](#25-configuración-del-cms-owncloud-o-joomla)  

3. [Pruebas y Verificación](#3-pruebas-y-verificación) 

4. [Errores Comunes y Soluciones](#5-errores-comunes-y-soluciones)

---

## 1. Introducción
La clase de ASIR 2º hemos tenido que hacer un CMS de 3 capas:
- **Capa 1**: Balanceador  
- **Capa 2**: 2 Servidores de BackEnds y un NFS  
- **Capa 3**: Base de datos (Mariadb)

### 1.1 Objetivo del Proyecto
Acceder al balanceador con una IP pública, que este distribuya las peticiones de los usuarios entre los 2 backends, que en NFS les está compartiendo la carpeta con el OwnCloud y que accedan a la información de la base de datos para logearte al OwnCloud.

### 1.2 Direccionamiento IP
**Balanceador**  
IP pública capa 1: `192.168.8.115`  
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
![image](https://github.com/user-attachments/assets/8a9be94e-d16b-4ef6-95c4-502e80fc256c)

### 2.1 Configuración del Balanceador de Carga  
![image](https://github.com/user-attachments/assets/b25049cd-f057-4a91-a5a8-a203b6d7ce4e)


### 2.2 Configuración de Servidores Web (Nginx)  
![image](https://github.com/user-attachments/assets/6c516998-1302-4154-80db-943f5aaa90ff)


### 2.3 Configuración del Servidor NFS y PHP-FPM  
![image](https://github.com/user-attachments/assets/c8104d12-135c-4191-b0f3-abe220c63ad3)


### 2.4 Configuración de la Base de Datos MariaDB  
![image](https://github.com/user-attachments/assets/c4c3c33c-d849-4895-b9f6-b6cf38e678ec)


### 2.5 Configuración del CMS (OwnCloud)  
![image](https://github.com/user-attachments/assets/6ed2bda6-5df7-4a3d-ad14-3e76a4e45c79)

---

## 3. Pruebas y Verificación
Una vez se hayan instalado todos los aprovisionamientos, comprobamos que todo vaya correctamente introduciendo el nombre del dominio o la IP en el navegador.
![image](https://github.com/user-attachments/assets/07760b22-f437-42de-a2c5-4e4da0a881ad)

---

## 4. Errores Comunes y Soluciones
Lo que más me ha costado ha sido poner el dominio en los servidores de backend, los errores que me daba eran relacionados con  que nginx, no podia escuchar en el puerto 80 y no he sabido como solucionarlo.
