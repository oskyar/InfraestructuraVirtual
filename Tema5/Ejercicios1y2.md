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



> ### 2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.