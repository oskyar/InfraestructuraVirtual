# Ejercicio 1
-------------

> ### 1. Instalar los paquetes necesarios para usar KVM. Se pueden seguir [estas instrucciones](https://wiki.debian.org/KVM#Installation). Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

* Tan solo hay que usar la orden 

		$ kvm-ok

* Y en caso de poder usarla nos dirá lo siguiente.

		INFO: /dev/kvm exists
		KVM acceleration can be used



# Ejercicio 2
-------------

> ### 1. Crear varias máquinas virtuales con algún sistema operativo libre, Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar [CoreOS](http://coreos.com/) (que sirve como soporte para Docker) [GALPon Minino](http://minino.galpon.org/en), hecha en Galicia para el mundo, [Damn Small Linux, SliTaz](http://www.damnsmalllinux.org/download.html) (que cabe en 35 megas) y [ttylinux](http://ttylinux.net/) (basado en línea de órdenes solo). 

1. Primera máquina (Debian) creada con los siguientes pasos, de forma muy sencilla.

	1. Creamos un disco duro virtual en formato **QCOW2**

		~~~
		Fomato:
			$ qemu-img create -f <formato> <nombreimagen.formato> <tamaño imagen>

        Orden:
			$ qemu-img create -f qcow2 discoDuro.qcow2 2G
		~~~

	2. Nos descargamos la versión de Debian para nuestra arquitectura (en mi caso amd64), pero a la vez minimalista.

			$ wget http://caesar.acc.umu.se/debian-cd/7.3.0/amd64/iso-cd/debian-7.3.0-amd64-netinst.iso

	3. Bien, como no sabemos si el módilo del kernel **KVM** está activado, lo activamos nosotros mismos.

        	En caso de INTEL:
    		$ sudo modprobe kvm-intel

            En caso de AMD:
            $ sudo modprobe kvm-amd

	4. Arrancamos **KVM** para instalar el sistema.

			$ qemu-system-x86_64 -hda ./discoDuro.qcow2 -cdrom ./debian-7.3.0-amd64-netinst.iso

	5. Procedemos a la instalación del sistema

		![Instalando Debian en VMK](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/Ej2-1-InstalandoDebianVMK.png)
        
    6. Durante el proceso nos hará preguntas de configuración, se van respondiendo hasta llegar al final.
    	
        ![Terminada Instalación Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/Ej2-2-TerminadaInstalacionDebian.png)
        
2. Instalamos otro sistema, por ejemplo... [Damn Small Linux, SliTaz](http://www.damnsmalllinux.org/download.html)
	* Y hacemos los mismos pasos:
 
			1. Creación del disco duro virtual
			2. Descarga del SO
			3. Mediante KVM instalamos el sistema
			
	* Pasos:
            1. $ qemu-img create -f qcow2 dsl.qcow2 2G
			2. $ wget ftp://distro.ibiblio.org/pub/linux/distributions/damnsmall/release_candidate/dsl-4.11.rc2.iso
			3. $ qemu-system-x86_64 -hda ./dsl.qcow2 -cdrom ./dsl-4.11.rc2.iso


> ### 2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

1. Yo voy a usar VirtualBox porque lo tengo ya instalando, para el que no lo tenga instalado tan fácil como hacer.
		$ sudo apt-get install virtualbox
        
2. Arrancamos virtualbox
 		$ virtualbox &
        
3. Le damos a siguiente y procedemos a instalar para el ejercicio FreeBSD (64 bits)
	![Instalando FreeBSD](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-3-InstalandoBSDconVB.png)
    
4. Seguimos y seleccionamos el tamaño de memoria para la ==Máquina Virtual==
	* Pongámosle 512 MB para ir sobrados (o no...)
	![Asignando memoria RAM a FreeBSD](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-4-AsignandoRAM.png)
    
5.  Como no hemos creado ningún **disco duro virtual**, le damos directamente a **siguiente**. Pero en el caso de tenerlo, le damos a la opción de ==Usar un archivo de disco duro virtual existente==, buscamos dónde está el archivo y seguimos configurando.

	![Escogiendo disco duropara FreeBSD](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-5-CogiendoDiscoDuroVirtual.png)

6. Escogemos el formato, ¿Cuál? nos lo explica muy bien en la siguiente imagen, aunque yo seleccionaré VDI que es el que viene por defecto para **VirtualBox**

	![Escogiendo disco duro para FreeBSD](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-6-EscogiendoFormato.png)

7. Ahora diremos si queremos almacenamiento **dinámico** o **estático**, como bien nos explica, lo bueno que tiene el *almacenamiento dinámico* es que se irá reservando memoria conforme vaya necesitando espacio el sistema, pero será algo más lento porque cada vez que necesite memoria tendrá que ir reservándola. En cambio la estática tarda más en su creación pero el acceso a ella es más rápido puesto que no habrá que reservar nada, **solo usar**.

	Así que escogeremos el que más nos convenga.
    
	![Escogiendo Tipo de Almacenamiento para FreeBSD](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-7-TipoAlmacenamiento.png)

8. Escribimos el nombre que queremos ponerle a la ==Máquina Virtual== y asignamos un tamaño al tamaño del **disco duro virtual**, por defecto 2 Gigas y *lo recomendado*.
	
	![Escogiendo Ubicación de Archivo y Tamaño para FreeBSD](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-8-UbicacionArchivoYTamaño.png)

9. Pinchamos en ==CREAR== y ya tenemos nuestra máquina lista para ejecutarla.

	![FreeBSD listo para iniciar](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej2-9-MaquinaInstalada.png)

