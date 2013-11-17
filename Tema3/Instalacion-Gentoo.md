##Instalación Gentoo 

**(Si estás leyendo es porque has realizado todos los pasos del [Èjercicio 3 - Punto 2](/Tema3/Ejercicios2y3.md#ejercicio3parte2) )**

1. Hay que ser usuario **ROOT**

		$ sudo su

2. Ejecutamos el comando (Debemos estar en el directorio donde queramos instalar gentoo)

		$ /usr/share/lxc/templates/lxc-gentoo create

3. Vamos contestando a las preguntas que nos hace (Siempre nos sugieren una opción por defecto)

	1.	What is the name for the container (recommended <=15 chars)?

		> En mi caso he puesto gentooGlobal porque he instalado Gentoo desde diferentes script y Global quiere decir Globalcitizen que es el repositorio desde donde lo he descargado (que es el más actualizado que he encontrado).

	2. What hostname do you wish for this container ?

		> De nuevo he puesto gentooGlobal aunque te sugiere `gentoo` a secas. (No sé si aquí poniendo el path `/home/lxc/gentoo` por ejemplo te crea el contenedor (no lo he probado))

	3. What IP address do you wish for this container (enter 'dhcp' to use DHCP) ?

		> He puesto el que viene por defecto `172.20.0.2/24`

	4. What is the gateway IP address ? 

		> Por defecto también `172.20.0.1`

	5. Type guest root password (enter for none/use already defined): 

		> Como lo he instalado de prueba, no he puesto ninguna contraseña para el root (He dado a enter sin escribir nada).

	6. Which mirror to use for stage3 and Portage archive ? 

		> Pregunta que desde qué página se descarga la distribución de gentoo, he dejado la que viene por defecto `http://distfiles.gentoo.org`


	7. Ahora nos escriben una nota: `Note that you will have to set up Qemu? emulation yourself if your CPU cannot natively execute the chosen 
	architecture (see README).`

		> Nos indica que tendremos que tener configurado **Qemu** ([Emulador de procesadores](http://es.wikipedia.org/wiki/QEMU "Qemu en la wikipedia")), de esto depende la arquitectura que escogamos, si tenemos dudas, visualizar el README que viene.

	8. Select desired container architecture:
	
		1\) alpha    3\) arm     5\) ia64	  7\) s390    9\) sparc
		
		2\) amd64    4\) hppa    6\) ppc	  8\) sh	    10\) x86
		
		\#?

		> He utilizado la misma arquitectura que el sistema host (amd64 -> 64 bits) para evitar problemas, por lo que pulso `2` en mi caso.

		![Proceso de instalación de Gentoo](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3b-proceso-instalacion-gentoo.png)


	9. Empezará a descargar algunos archivos más de la arquitectura que hemos escogido para mostrarnos otras variantes y nos preguntará:

		Select desired container subarchitecture/variant for amd64:
		
		1\) amd64-hardened+nomultilib  4\) amd64
		
		2\) amd64-hardened	      5\) x32
		
		3\) amd64-nomultilib
		
		\#?

		> Aquí no sé en qué difieren unas arquitecturas de otras así que me he dejado llevar por la opción `4` que me parece la más normal.

		![Escogiendo variante de la arquitectura](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3b-Escogiendo-variante-arquitectura.png)

	10. Ya comenzará la descarga y se configurará todo.

		![Instalación de Gentoo terminada](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3b-Instalacion-gentoo-terminada.png)

	11. Finalmente, nos muestra algunas indicaciones para lanzar el contenedor ó para modificar sus archivos de configuración sin tener que arrancar el contenedor:

		![Ejecución y configuración opcional de gentoo](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio3b-Ejecucion-y-configuracion-opcional.png)

4. Y ya tenemos instalado Gentoo con LXC.


### [Volver al Ejercicio3](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/Ejercicios2y3.md)