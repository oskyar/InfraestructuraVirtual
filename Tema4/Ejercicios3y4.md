### [Ejercicios 1 y 2](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema4/Ejercicios1y2.md)

# Ejercicio 3
------------


> ###  Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre

* Empezaremos creando una imagen para `raw`, para `qcow2` y `vmdk` con qemu-img

		$ Este es el formato a seguir:
		$ create [-f fmt] [-o options] filename [size]

		$ qemu-img create -f raw imgRaw.raw 10M
		$ qemu-img create -f qcow2 imgQcow2.qcow2 15M
		$ qemu-img create -f vmdk imgVmdk.vmdk 20M

![Creando imágenes](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio3-CreandoImg.png)

* Ahora comprobamos que son reconocidas desde un software de virtualización como es `Oracle VM VirtualBox`
* Algunas de las imágenes reconocidas por VirtualBox:
		VMDK,VMD,VHD,VHDX,VDI, Parallels, QED, QCOW...


![Comprobando imágenes](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio3-ComprobandoImg.png)
		


# Ejercicio 4
-------------

> ### Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema

1. Creamos las imágenes como en el [Ejercicio 3](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema4/Ejercicios3y4.md#ejercicio-3)

		$ qemu-img create -f raw imagen1.img 100M
		$ qemu-img create -f raw imagen2.img 100M

2. Las hacemos accesibles al usuario mediante la orden `losetup`

		$ sudo losetup -v -f imagen1.img
		$ sudo losetup -v -f imagen2.img

	![Accesibilidad a las imágenes](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio4-AccesibilidadImagenes.png)

3. Le damos formato a nuestras imágenes (*En caso de error ir al paso 4*)

		Formato a seguir:
		$ mkfs [options] [-t type fs-options] device [size]

		$ mkfs.xfs imagen1.img
		$ mkfs.btrfs imagen2.img

	![Formateando las imágenes](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio4-FormateandoImagenes.png)

4. Si nos da error al hacer formato, es porque nos faltan las dependencias necesarias. La instalamos y volvemos al paso 3.

		Para btrfs
		$ sudo apt-get install btrfs-tools

5. Vamos a montar las imágenes, para ello crearemos los directorios de montaje en `/mnt/` para ello necesitamos permisos de superusuario

		$ sudo mkdir /mnt/xfs
		$ sudo mkdir /mnt/btrfs

6. Ahora ya si podemos montar las imágenes con **permisos de superusuario**. (Actualmente estoy en la carpeta donde he creado las imágenes)
		
		Formato
		$ mount -t tipo dispositivo direccion_montaje

		$ sudo mount -t xfs /dev/loop1 /mnt/xfs
		$ sudo mount -t btrfs /dev/loop2 /mnt/btrfs

7. Creamos un archivo de bloques de 50M para copiarlo en ambos sistemas de ficheros para comprobar cuál de los dos sistemas es más rápido.

		dd if=/dev/urandom of=fichero bs=1k count=50k

	![Creando fichero de prueba](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio4-CreandoFichero.png)

8. Copiando el archivo en ambos sistemas de archivos

		$ sudo time -v cp fichero /mnt/xfs/fichero

	![Copiando fichero al sistema de archivos XFS](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio4-CopiandoAXfs.png)

		$ sudo time -v cp fichero /mnt/btrfs/fichero

	![Copiando fichero al sistema de archivos BTRFS](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio4-CopiandoABtrfs.png)


	Como podemos comprobar el tiempo de la **CPU** en *XFS* ha sido del **54%** y en *BTRFS* del **7%**, ha sido mucho **menor** en éste **último** aunque el *tiempo* de transferencia ha sido el **mismo**.




