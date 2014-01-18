_Tabla de Contenidos_

[TOC]

# Ejercicio 3
-------------

> ### Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con ==qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img==


# Ejercicio 4
-------------
> ### Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

1. Para empezar podemos **ó** _descargarnos_ una distribución de linux que tenga un entorno gráfico **LXDE**, [aquí](http://wiki.lxde.org/es/Categor%C3%ADa:Distribuciones_de_GNU/Linux) (se pueden ver distribuciones que traen por defecto este entorno gráfico) **ó** simplemente le voy a instalar ** DEBIAN con el entorno gráfico LXDE** desde **0**

2. Descargamos de nuevo la imagen de Debian en caso de no tenerla.

        $ wget http://caesar.acc.umu.se/debian-cd/7.3.0/amd64/iso-cd/debian-7.3.0-amd64-netinst.iso

3. Creamos el disco duro virtual, lo llamaremos discoDuroVirtual

		$ qemu-img create -f qcow2 discoDuro.qcow2 5G
    
4. Bien, como no sabemos si el módilo del kernel **KVM** está activado, lo activamos nosotros mismos.

        En caso de INTEL:
    		$ sudo modprobe kvm-intel

        En caso de AMD:
            $ sudo modprobe kvm-amd

5. Arrancamos **KVM** para instalar el sistema.

        $ qemu-system-x86_64 -hda ./discoDuro.qcow2 -cdrom ./debian-7.3.0-amd64-netinst.iso
 
6. Empezamos la instalación.

	![Instalando Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej4-1.ArrancandoQEMU.png)
    
7. Y como queremos instalar el **entorno gráfico LXDE** vamos a darle a "**Advanced options**" > "**Alternative desktop environments**" > "**LXDE**" > "**Install**"
	![Escogiendo Entorno gráfico en Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej4-2.EscogiendoEntornoGrafico.png)
   
8. Escogemos el lenguaje en el que queramos instalar Debian. (*Español en mi caso*), y las siguientes

	![Seleccionando lenguaje en Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej4-3.SeleccionandoLenguaje.png)
    
9. Seleccionamos nuestra ubicación (*España*, en mi caso)
	
    ![Seleccionando ubicación en Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej4-4.EscogiendoUbicacion.png)
    
10. Con la configuración del teclado igual, seleccionamos español, a no ser que queramos ó necesitemos otra.

    ![Configurando teclado en Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej4-5.ConfigurandoTeclado.png)
    
11. Y ya estamos listo, empieza la instalación (Tardará unos 20 minutos, porque irá descargando dependencias necesarias y demás)

 	![Empieza la instalación de Debian](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej4-6.EmpezandoInstalacion.png)

12. Se van rellenando, seleccionando y configurando lo que nos vaya pidiendo la instalación (Ante la duda, la opción por defecto).




