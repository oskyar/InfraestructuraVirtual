# Ejercicio 1
-------------

> ### 1\. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones?  ¿Volúmenes lógicos?

* Está instalado a través del conector SATA, es rotatorio y de 500GB.

* Sí, uso 3 más las que crean el sistema de windows, más otra para el boot de arranque.

![Particiones](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio1.1.png)

* Sí, 4, las 4 particiones que tengo para el SO Windows, SO Ubuntu, Almacenamiento y Swap

![Particiones](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio1.3.png)

> ### 2\. Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?

> ### 3\. Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.


# Ejercicio 2
------------

> ### 1\. Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

* Vamos a utilizar un contenedor instalado en prácticas anteriores e instalaremos sshfs y fuse.

		$ lxc-start -n contenedor
		$ sudo apt-get install sshfs fuse

* Cambiamos la ip del contenedor por medio de `lxc-webpanel` para eso accedemos a él poniendo en el navegador `localhost:5000`. Claro está que deberemos tenerlo instalado.

* Tenemos que comprobar qué máscara tiene nuestro puente con...

	$ ifconfig

![Ip del puente](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio2-ifconfig.png)

* Podemos que observar en el que está señalado que la máscara sería 10.0.3.X por lo que yo he optado por asignarle la ip 10.0.3.3 al contenedor y accedemos de la siguiente manera

		$ sshfs ubuntu@10.0.3.3:/home/ubuntu remoteHost

* En la siguiente captura podemos observar como se crea el directorio, comprobamos que está vacío, nos conectamos mediante sshfs y vemos que se ha montado el directorio del contenedor. (Aclaración: El contenedor debe de estar arrancado (evidentemente)).

![Ip del puente](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio2-sshfs.png)


### [Ejercicios 3 y 4](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema4/Ejercicios3y4.md)