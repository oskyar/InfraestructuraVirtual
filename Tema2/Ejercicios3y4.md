# Ejercicio3
------------

> 1) Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

	Instalamos el programa "debootstrap" si no lo tenemos con:

		sudo apt-get install debootstrap

	Escribiendo la siguiente orden en nuestro terminal 
	sudo debootstrap --arch=amd64 saucy /home/jaulas/saucy/ http://archive.ubuntu.com/ubuntu

	comenzará a descargarnos el sistema minimal de Ubuntu (Saucy - Ubuntu 13.10)

![captura1]()

	Y ahora observamos que hay dentro del directorio /home/jaulas/saucy

![captura2]()

> 2) Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.
	
	Instalamos el programa "rinse" si no lo tenemos con:

		sudo apt-get install rinse

	Y ahora con la siguiente orden descargaremos la distribución de fedora 7 para una arquitectura de 32 bits.

		sudo rinse --arch=i386 --distribution fedora-core-7 --directory /home/jaulas/fedora/

![captura3]()

	Y ahora observamos que hay dentro del directorio /home/jaulas/saucy

![captura4]()

