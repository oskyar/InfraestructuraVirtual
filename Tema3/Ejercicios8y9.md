# Ejercicio 8
-------------

> Instalar libvirt. Te puede ayudar esta [guía para Ubuntu](https://help.ubuntu.com/12.04/serverguide/libvirt.html)

* Para instalar la librtería libvirt que nos ayudará a manejar los contenedores fácilmente, tan solo debemos instalarlo del repositorio

		$ sudo apt-get install kvm libvirt-bin

* Para poder usar esta librería habrá que crear un usuario que será el encargado de manejarla, para ello añadiremos un usuario al grupo `libvirtd` ó coger un usuario y meterlo en ese grupo.

		$ sudo adduser $USER libvirtd


# Ejercicio 9
-------------

> Instalar un contenedor usando virt-install.

* Empezamos instalando virt-install y las librerías que necesita

		$ sudo apt-get install virt-viewer virtinst

* Instalamos el manager de virt que nos ayudará mucho mediante la interfaz 

		$ sudo apt-get install virt-manager

**NOTA:** Es posible que una vez instalado `virt-manager` e iniciado pida instalar alguna librería, le damos a que si y reiniciamos el programa.

* Ya podemos seguir el [tutorial de creación de contenedores con virt-install](https://fedoraproject.org/wiki/Getting_started_with_virtualization#Creating_a_guest_with_virt-install) que nos ha puesto @jj


* Comando para instalar el hipervisor:

		$ sudo virt-install --name tails0.21 --ram 512 --disk path=/home/tails0.21,size=5 --cdrom='/home/oskyar/Escritorio/tails-i386-0.21.iso'  --graphics vnc

	######Argumentos:

	name = nombre de nuestra VM
	ram = la cantidad de memoria RAM a asignar en MB
	disk = la dirección en donde queremos crear el archivo o LV (path) y el tamaño (size)
	location = el medio de instalación, en este caso uso cdrom ya que tengo la iso descargada.
	graphics = el modo gráfico a utilizar

![Instalando con virt-install](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio9-InstalaciónVirt-Inst.png)


