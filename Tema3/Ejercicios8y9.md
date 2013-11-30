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

* Empezamos instalando virt-install

		$ sudo apt-get install virt-install

* Y ahora podemos seguir el [tutorial de creación de contenedores con virt-install](https://fedoraproject.org/wiki/Getting_started_with_virtualization#Creating_a_guest_with_virt-install) que nos ha puesto @jj

		