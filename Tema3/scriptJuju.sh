#! /bin/bash
# Este script sirve para crear un entorno con JuJu, 
# desplegar los servicios mediawiki y mysql, 
# añadir la relacion entre ambos, exponer mediawiki
# y ver el estado que en el que está.

# Realizado por Oscar Zafra, (oskyar en github)

if [ $# == 0 ]; then
	
	printf "\n**********************"
	printf "\n** Script para Juju **\n"
	printf "**********************\n"
	printf "\n1. Crear entorno (mediawiki + mysql)"
	printf "\n2. Destruir todo el entorno (mediawiki + mysql + entorno)"
	printf "\n3. Salir\n"
	read -n1 -p "Elija una opción: " OPCION
	printf "\n"

	while [ $OPCION -lt 1 ] || [ $OPCION -gt 3 ];
	do 
		read -n1 -p "Escoja una opción correcta: " OPCION
		printf "\n"
	done

	case $OPCION in
		1 )
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
			;;
		2 )
			read -n1 -p "¿Está seguro de que desea destruir el entorno local [S/n]? " OPCION
			printf "\n"

			while [ $OPCION != "S" ] && [ $OPCION != "s" ] && [ $OPCION != "N" ] && [ $OPCION != "n" ];
			do 
				read -n1 -p "¿Está seguro de que desea destruir el entorno local [S/n]? " OPCION
				printf "\n"
			done
			
			case $OPCION in
			S | s )
				echo "[ Quitamos la exposición de mediawiki ]"
				juju unexpose mediawiki
				echo "[ Eliminando la relación ]"
				juju destroy-relation mediawiki:db mysql
				echo "[ Eliminando el servicio mysql ]"
				juju destroy-service mysql
				echo "[ Eliminando el servicio mediawiki ]"
				juju destroy-service mediawiki
				echo "[ Destruyendo el entorno ]"
				sudo juju destroy-environment
			;;
			N | n ) printf "[ Cancelada la destrucción del entorno ]" 
			;;
			esac
		;;
		3 ) 
			# echo "Saliendo..."
		;;
	esac	

elif [ $# == 1 ]; then
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
		
		read -n1 -p "¿Está seguro de que desea destruir el entorno local [S/n]? " OPCION
		printf "\n"
		case $OPCION in
			S | s )

				echo "[ Quitando la exposición de mediawiki ]"
				juju unexpose mediawiki
				echo "[ Eliminando la relación ]"
				juju destroy-relation mediawiki:db mysql
				echo "[ Eliminando el servicio mysql ]"
				juju destroy-service mysql
				echo "[ Eliminando el servicio mediawiki ]"
				juju destroy-service mediawiki
				echo "[ Destruyendo el entorno ]"
				sudo juju destroy-environment
			;;
			N | n ) printf "\n[ Cancelada la destrucción del entorno ] \n" 
			;;
		* ) printf "\n [ Ejecución cancelada, selección invalida ] \n";;
		esac

		
		


	else
		printf "\"$1\" es incorrecto, escriba: crear o destruir ó ejecute el script sin argumentos\n"
	fi
else
	echo "Solo se admite un parámetro"
	echo "Para crear    --> ./scriptJuju.sh crear"
	echo "Para destruir --> ./scriptJuju.sh destruir"
fi