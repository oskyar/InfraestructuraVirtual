### [Ejercicio 1 y 2](https://github.com/oskyar/InfraestructuraVirtual/edit/master/Tema2/Ejercicios1y2.md)


# Ejercicio3
------------

> ### 1) Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

+ Instalamos el programa "debootstrap" si no lo tenemos con:

		sudo apt-get install debootstrap

+ Escribiendo la siguiente orden en nuestro terminal 

		sudo debootstrap --arch=amd64 saucy /home/jaulas/saucy/ http://archive.ubuntu.com/ubuntu
	
+ Comenzará a descargarnos el sistema minimal de Ubuntu (Saucy - Ubuntu 13.10)

![captura1](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio%203%20a%29%20.png)

+ Y ahora observamos que hay dentro del directorio */home/jaulas/saucy*

![captura2](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio%203%20a%29%202.png)

> ### 2) Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.
	
+ Instalamos el programa "rinse" si no lo tenemos con:

		sudo apt-get install rinse

+ Y ahora con la siguiente orden descargaremos la distribución de fedora 7 para una arquitectura de 32 bits.

		sudo rinse --arch=i386 --distribution fedora-core-7 --directory /home/jaulas/fedora/

![captura3](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio%203%20b%29%201.png)

+ Y ahora observamos que hay dentro del directorio */home/jaulas/saucy*

![captura4](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio%203%20b%29%202.png)


# Ejercicio4
------------

> ### Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.

+ El sistema Ubuntu es un sistema basado en Debian por lo que el primer apartado ya lo tendríamos completado.

+ Primero de todo sería entrar a la jaula con:

		sudo chroot /home/jaulas/saucy

+ Y tendremos:

![captura chroot](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio4-chroot-jaula-saucy.png)

*(No hacer caso al mensaje intermedio, me sale porque le he cambiado el hostname a la jaula)*


+ Ejecutamos la orden top y veamos que sucede:

![MontandoProc](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio4-montandoProc.png)

+ Vemos que al utilizar *top* nos da error porque no está montado el sistema de ficheros de los procesos (/proc). 

	+ Montamos /proc

			$ mount -t proc proc /proc
		
+ Ahora si tiene más sentido la segunda parte de la imagen anterior, dónde se ven ya los procesos al utilizar la directiva *top*




+ Sigamos instalando los paquetes de idiomas para que no tengamos problemas al utilizar los programas.

		$ sudo apt-get install language-pack-es

+ Se descarga y dejamos que se instale y configure solo.

![InstalandoIdiomas](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio4-instalandoIdiomas.png)


+ Instalamos la aplicación nano, que es un edior de texto.

		sudo apt-get install nano

+ Cremamos un archivo y lo ejecutamos con nano.

		sudo nano archivo.txt 

+ Modificamos el archivo y con la siguiente orden vemos el contenido.

		cat archivo.txt

Y con esto ya habríamos probado a instalar aplicaciones dentro de una jaula.
