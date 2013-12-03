# Ejercicio 2
-------------

> Comprobar qué interfaces puente ha creado y explicarlos

Para comprobar qué interfaces puentes ha creado el contenedor (creado con lxc) escribiremos esta orden.

    $ sudo brctl show

Y observaremos lo siguiente:

![Interfaces puentes](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio2-InterfacesPuentes.png)

Vemos que hay un interfaz con el nombre **lxcbr0** que es el puente encargado de darnos acceso a la red desde dentro del contenedor, pero observamos que tiene una id nula y no tiene un nombre de interfaz. 

Vamos a probar a lanzar el contenedor y mostrar de nuevo las interfaces puente a ver qué sucede.

* Lanzamos el contenedor
		
		$ sudo lxc-start -n primer-contenedor

* Comprobamos que el contenedor está en funcionamiento

		$ sudo lxc-list

![Comprobación contenedor lanzado](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio2-ComprobacionContenedorLanzado.png)


* Volvemos a mostrar los interfaces puentes

		$ sudo brctl show

![Contenedor Lanzado - Interfaz Puente](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio2-ContenedorEjecutado-InterfazPuente.png)

Ahora vemos que se le ha asignado una id y un nombre de interfaz, en mi caso `veth0GRUQK` tal y como se nos muestra en los apuntes, con el prefijo **veth**.


* Y ya desde nuestro contenedor comprobamos que nuestra Interfaz Puente está creada y configurada correctamente haciendo ping a una página.

		$ ping www.google.es

![Comprobando Ejecución Interfaz](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio2-ComprobandoEjecucionInterfaz.png)


# Ejercicio 3
-------------
> ###1\. Crear y ejecutar un contenedor basado en Debian.

> > El ejercicio anterior está basado en un sistema debianita (Ubuntu), pero indicaré como es la creación del contenedor y la ejecución..

* Creación del contenedor debianita.

		$ sudo lxc-create -t ubuntu -n un-contenedor

![Creacion de un Contenedor de un sistema Ubuntu](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3-CreandoContenedorUbuntu.png)

* Ejecución del contenedor

		$ lxc-start -n un-contenedor

* Y nos aparece esto, ¿por qué?

![Ejecucion contenedor sin permisos de superusuario](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3-ErrorEjecucionContenedorUbuntu.png)

###### ¡¡Porque hay que hacerlo con permisos de superusuario!!


* Probamos de nuevo con permisos de superusuario

		$ sudo lxc-start -n un-contenedor

![Ejecución Contenedor Ubuntu](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3-EjecucionContenedorUbuntu.png)

* Le damos a "Enter ó Intro" y ya nos aparecerá para iniciar sesión con el usuario

	> Recordad que los datos son:

	> Usuario: ubuntu

	> Contraseña: ubuntu

* Y ya estaremos dentro y logueados en nuestro contenedor

![Ejecucion y log in contenedor ubuntu](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3-EjecucionYLoginContenedorUbuntu.png)

----------------------------------
###### Recordatorio para parar la ejecución de un contenedor:

* Desde otra terminal debemos ejecutar la siguiente orden (como superusuario)

		$ sudo lxc-stop -n nombre-contenedor

----------------------------------


> ### 2\. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya.

> > Como mi sistema tiene una distribución de Ubuntu instalada (versión 13.10) doy por realizada la primera parte del ejercicio2.

* Debido a los problemas para la instalación de Fedora; que estos problemas pueden ser debidos a que el host *(en mi caso)* es `Ubuntu 13.10` y tiene un **kernel** demasiado actualizado para poder crear un contenedor con `Fedora` ya que utiliza un kernel de una versión inferior. 
Sabemos que al crear un contenedor uno de los requisitos que restrigen el uso de contenedores es que el kernel de los sistemas dentro de los contenedores deben usar la misma versión que el del host. Por ello voy a pasar a instalar la distribución de Gentoo, pero no sin antes comprobar los **templates** que tiene lxc (Plantillas para LXC de diferentes distribuciones de Linux para la instalación y configuración de los contenedores).

		$ ls /usr/share/lxc/templates

![Templates de LXC](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3b-TemplatesLxc.png)

* Vemos que no tenemos Gentoo, pero lo podemos descargar de [plantilla de Gentoo para LXC](https://raw.github.com/globalcitizen/lxc-gentoo/master/lxc-gentoo)

* Descargamos la plantilla y lo colocamos en el directorio `/usr/share/lxc/templates/`

	    $ sudo wget -P /usr/share/lxc/templates/ https://raw.github.com/globalcitizen/lxc-gentoo/master/lxc-gentoo

* Damos permisos de ejecución

	    $ sudo chmod +x /usr/share/lxc/templates/lxc-gentoo

* Y ya podemos crear el contenedor, aunque ésta vez se crea de distinta forma debido a cómo está configurado el script, por ello tan solo con ejecutar el script ya nos va indicando qué los pasos a seguir.

	**NOTA: El script hay que ejecutarlo como usuario `ROOT`**

	**NOTA 2: El contenedor se crea desde el PATH en el que se ha ejecutado el script**

	    $ /usr/share/lxc/templates/lxc-gentoo create


* ### [Paso a paso la instalación (realizado por mi)](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/Instalacion-Gentoo.md#instalaci%C3%B3n-gentoo)

* Ahora para lanzar el contenedor de Gentoo debemos indicar el archivo de configuración y el nombre del contenedor (**lanzarlo como root**:

		$ lxc-start -f gentooGlobal.conf -n gentooGlobal

	![Lanzando Gentoo](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3b-Lanzando-Gentoo.png)


* Y finalmente para *parar* un contenedor, desde otra terminal ejecutamos:

		$ sudo lxc-stop -n gentooGlobal



### [Ejercicios 4 y 5](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/Ejercicios4y5.md)