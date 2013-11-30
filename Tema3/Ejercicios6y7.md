# Ejercicio 6
-------------

> 1. Instalar juju.

	- Para instalar juju seguimos los pasos que se indican en la guía.

		$ sudo sudo add-apt-repository ppa:juju/stable
		$ sudo apt-get update && sudo apt-get install juju-core

	- Lo configuramos para que funcione en modo local, cambiando en el  archivo `~/.juju/environments.yaml` 

	+ Comentamos

			default: amazon

	+ Y escribimos

			# default: amazon
			default: local



> 2. Usándolo, instalar MySql en un táper.



# Ejercicio 7
-------------

> 1. Destruir toda la configuración creada anteriormente
> 2. Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.
> 3. Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.



