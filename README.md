# -Instalacion-de-CMS-en-arquitectura-de-3-capas-en-alta-disponibilidad

# Índice

1. [Introducción](#introducción)
   1.1. [Objetivo del Proyecto](#objetivo-del-proyecto)  
   1.2. [Direccionamiento IP](#direccionamiento-ip)

2. [Instalación y Configuración](#instalación-y-configuración)
   4.1. [Instalación de Vagrant y VirtualBox](#instalación-de-vagrant-y-virtualbox)  
   4.2. [Aprovisionamiento de Máquinas Virtuales con Vagrant](#aprovisionamiento-de-máquinas-virtuales-con-vagrant)  
   4.3. [Configuración del Balanceador de Carga](#configuración-del-balanceador-de-carga)  
   4.4. [Configuración de Servidores Web (Nginx)](#configuración-de-servidores-web-nginx)  
   4.5. [Configuración del Servidor NFS y PHP-FPM](#configuración-del-servidor-nfs-y-php-fpm)  
   4.6. [Configuración de la Base de Datos MariaDB](#configuración-de-la-base-de-datos-mariadb)  
   4.7. [Configuración del CMS (OwnCloud o Joomla)](#configuración-del-cms-owncloud-o-joomla)  
   4.8. [Configuración de SSL](#configuración-de-ssl)

3. [Pruebas y Verificación](#pruebas-y-verificación)


4. [Visualización de la Aplicación en Funcionamiento](#visualización-de-la-aplicación-en-funcionamiento)  
5. [Errores Comunes y Soluciones](#errores-comunes-y-soluciones)



## 1. Introcuccion
La clase de ASIR 2º hemos tenido que hacer un CMS de 3 capas:
Capa 1: Balanceador
Capa 2: 2 Servidores de BackEnds y un NFS
Capa 3: Base de datos (Mariadb)

# 1.1. Objetivos del proyecto
Acceder al balanceador con una ip pública, que este distribuya las peticiones de los usuarios entre los 2 backends, que en NFS les está compartiendo la carpeta con el owncloud y que accedan a la informacion de la base de datos para logearte al owncloud.

# 1.2. Direccionamiento IP

Balanceador
IP pública capa 1: 192.168.
IP privada capa 2: 192.168.56.10

WEB1
IP privada capa 2: 192.168.56.11

WEB2
IP privada capa 2: 192.168.56.12

NFS
IP privada capa 2: 192.168.56.13

Base de Datos
IP privada capa 3: 192.168.57.14
IP privada capa 2: 192.168.56.14


## 2. Instalación y Configuración
Editamos el vagrantfile para crear la estructura de la prueba.


Hacemos los aprovisionaminetos de cada máquina.

Base de Datos


NFS


WEB1


WEB2


Balanceador



## 3. Pruebas y Verificación
Una vez se hayan instalado todos los aprovisionamientos, comprobamos que todo vaya correctamente introduciento el nombre del dominio o la ip en el navegador.


## 4. Visualización de la Aplicación en Funcionamiento



## 5. Errores Comunes y Soluciones
Lo que más me ha costado ha sido poner el dominio en los servidores de backend, los errores que me daba eran de que 




