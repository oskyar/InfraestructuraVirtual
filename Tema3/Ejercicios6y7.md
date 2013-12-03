###[Ejercicios 4 y 5](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/Ejercicios4y5.md)

# Ejercicio 6
-------------

> 1\. Instalar juju.

- Para instalar juju seguimos los pasos que se indican en la guía.

		$ sudo sudo add-apt-repository ppa:juju/stable
		$ sudo apt-get update && sudo apt-get install juju-core

- Creamos el archivo de configuración.

		$ juju init

- Modificamos el archivo de configuración para que funcione en modo local, el  archivo está en `~/.juju/environments.yaml` 

	+ Comentamos

			default: amazon

	+ Y escribimos

			# default: amazon
			default: local

- Instalamos MongoDB para poder echar a funcionar `MySql`

		$ sudo apt-get install mongodb-server

- Creamos el entorno:

		$ juju bootstrap


> 2\. Usándolo, instalar MySql en un táper.

+ Ahora desplegamos MySql

		$ juju deploy mysql

+ Y vemos su estado desde 

		$ juju status

![mysql desplegado](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio6-mysqlDesplegado.png)

**NOTA:** Al principio siempre está en `pending`, hasta que pasa un rato y se cambia a `started` automáticamente (Se paciente).

# Ejercicio 7
-------------

> ###1\. Destruir toda la configuración creada anteriormente

+ Empezamos destruyendo el servicio mysql.

		$ juju destroy-service mysql

![Destruyendo el servicio Mysql](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-DestruyendoMysql.png)

+ Destruimos el entorno.

		$ juju destroy-environment

![Destruyendo entorno](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-DestruyendoEntorno.png)

> ###2\. Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.

+ Hacemos todos los pasos de nuevo:

		$ sudo juju bootstrap
		$ juju deploy mediawiki
		$ juju deploy mysql

+ Añadimos la relación de *mediawiki* con *mysql*
		
		$ juju add-relation mediawiki:db mysql

+ Exponemos el servicio *mediawiki*

		$ juju expose mediawiki

+ Y ahora comprobamos el estado.

		$ juju status

![Estado mediawiki](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-MediawikiDesplegado1.png)
![Estado mediawiki2](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-MediawikiDesplegado2.png)

+ Podemos observar que dentro del servicio `mediawiki`, al final, nos indica en `public-addresss` la ip `10.0.3.228` con la que ha expuesto el servicio mediawiki. Y vamos a comprobarlo.

+ Vamos al navegador y escribimos `10.0.3.228`.

![Comprobando mediawiki en el navegador](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-ComprobandoEnElNavegador.png)


> ###3\. Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.

+ El script permite un argumento o ninguno.

	+ Sin ningún argumento:

	![Script sin parámetros](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-3-ScriptSinParametros.png)

	+ Con el argumento `crear`

	![Script con el argumento crear](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-3-ScriptConParametroCrear.png)

	+ Con el argumento `destruir`

	![Script con el argumento crear](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio7-3-ScriptConParametroDestruir.png)

	+ Para descargar el script ejecutar este comando.

			$ wget https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/scriptJuju.sh

	+ Recuerda darle permisos de ejecución

			$ sudo chmod +x ./scriptJuju.sh

	+ [Ver el script](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/scriptJuju.sh)


### [Ejercicios 8 y 9](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/Ejercicios8y9.md)

