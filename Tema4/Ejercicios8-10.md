# Ejercicio 8

> ###Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente

1. Creamos nuestra cuenta en Azure. [Enlace](http://www.WindowsAzurePass.com/azureu)

2. Para instalar la línea de órdenes de azure debemos instalar las siguientes dependencias con este orden. [Click aquí para más detalle](http://www.windowsazure.com/en-us/documentation/articles/xplat-cli/)

	1. Instalar node.js desde un repositorio externo (con el que trae ubuntu da errores)

		1. Añadimos el repositorio

			$ sudo add-apt-repository ppa:chris-lea/node.js

		2. Actualizamos nuestros repositorios locales

			$ sudo apt-get update

		3. Instalamos nodejs

			$ sudo apt-get install nodejs

	2. Instalar npm. 

			$ sudo apt-get install npm

	3. Instalamos el cliente de azure.

			$ sudo npm install azure-cli -g

	4. Si hemos recibido la subscripción ejecutamos el siguiente comando para descargar nuestra configuración.

			$ azure account download

			![Configurando Azure en Local](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio8-ConfigurandoAzure.png)

	5. Seguimos los pasos que nos han indicado en el paso 4 al ejecutar el comando.

			$ azure account import Azpad246M**********.publishsettings

	6. Borramos el archivo como nos indica porque contiene información importante.

			$ rm Azpad24*

3. Comprobamos que tenemos bien configurada la cuenta

		$ azure account list

		![Comprobación de la cuenta de Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio8-ComprobacionCuentaAzure.png)

4. Procedemos a crear una cuenta de almacenamiento.

	1. Creamos la cuenta de almacenamiento

		$ azure account storage create oskyar

		![Creando cuenta de almacenamiento en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio8-CreandoCuentaAlmacenamiento.png)
	
	2. Creamos la clave

		$ azure account storage keys list oskyar

		![Creando cuenta de almacenamiento en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio8-ClaveAlmacenamiento.png)
	
	3. Exportamos nuestra cuenta

		$ export AZURE_STORAGE_ACCOUNT=oskyar
	
	4. Exportamos nuestra clave que nos proporciona Azure

		$ export AZURE_STORAGE_ACCESS_KEY=<Clave proporcionada por Azure>

	5. Comprobamos que se han exportado bien los datos.
		$ echo $AZURE_STORAGE_ACCOUNT
		$ echo $AZURE_STORAGE_ACCESS_KEY

5. Y si queremos comprobarlo mediante la web, hay que entrar en https://manage.windowsazure.com/




# Ejercicio 8

> ###Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.

1. Vamos a crear un contenedor desde el CLI de Azure.

		$ azure storage container create iv-imagenes -p blob

		![Creando contenedor](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio9-Imagen1.png)

2. Subimos la imagen anterior

		$ azure storage blob upload Ejercicio9-Imagen1.png iv-imagenes

		![Subiendo imagen al contenedor](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio9-SubiendoImagen2.png)

		Se puede comprobar que la imagen está subida en este enlace `http://oskyar.blob.core.windows.net/iv-imagenes/Ejercicio9-Imagen1.png`

3. Subimos a Azure del resultado de la subida de la primera imagen

		$ azure storage blob upload Ejercicio9-SubiendoImagen2.png iv-imagenes

		Aquí también se puede comprobar que se ha subido al conteneder en Azure `http://oskyar.blob.core.windows.net/iv-imagenes/Ejercicio9-SubiendoImagen2.png`

