

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
* Las imágenes reconocidas por VirtualBox son las siguientes:
		VMDK,VMD,VHD,VHDX,VDI, Parallels, QED, QCOW...


![Comprobando imágenes](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio3-ComprobandoImg.png)
		












# Ejercicio 4
-------------


* Le damos formato a nuestras imágenes

		$ Formato a seguir:
		$ mkfs [options] [-t type fs-options] device [size]

	* Pero hay diferentes órdenes para los diferentes sistemas de fichero:

			mkfs.bfs(8), mkfs.ext2(8), mkfs.ext3(8), mkfs.ext4(8), mkfs.minix(8), mkfs.msdos(8),
       		mkfs.vfat(8), mkfs.xfs(8), mkfs.xiafs(8)

    	Dando formato...

    	mkfs.ext4 ./imgRaw.raw

