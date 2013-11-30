#! /bin/bash
# Este script sirve para crear un entorno con JuJu, 
# desplegar los servicios mediawiki y mysql, 
# añadir la relacion entre ambos, exponer mediawiki
# y ver el estado que en el que está.

if [ $# == 1 ]; then
	if [ $1 == "crear" ]; then
		
		echo "[ Cambiando a modo local ]"
		juju switch local
		echo "[ Creando entorno ]"
		sudo juju bootstrap
		echo "[ Desplegando el servicio mediawiki ]"
		juju deploy mediawiki
		echo "[ Desplegando el servicio mysql ]"
		juju deploy mysql
		echo "[ Creando relación entre mediawiki y mysql ]"
		juju add-relation mediawiki:db mysql
		echo "[ Exponiendo mediawiki ]"
		juju expose mediawiki
		echo "[ Comprobamos el estado del entorno ]"
		juju status

	elif [ $1 == "destruir" ]; then
		echo "[ Quitamos la exposición de mediawiki ]"
		juju unexpose mediawiki
		echo "[ Eliminamos la relación ]"
		juju destroy-relation mediawiki:db mysql
		echo "[ Eliminando el servicio mysql ]"
		juju destroy-service mysql
		echo "[ Eliminando el servicio mediawiki ]"
		juju destroy-service mediawiki
		echo "[ Destruyendo el entorno ]"
		sudo juju destroy-environment
		


	else
		printf "\"$1\" es incorrecto, escriba: crear o destruir\n"
	fi
else
	echo "Solo se admite un parámetro"
	echo "Para crear    --> ./scriptJuju.sh crear"
	echo "Para destruir --> ./scriptJuju.sh destruir"
fi