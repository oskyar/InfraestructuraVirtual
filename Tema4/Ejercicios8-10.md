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




# Ejercicio 9

> ###Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.

1. Vamos a crear un contenedor desde el CLI de Azure.

		$ azure storage container create iv-imagenes -p blob

	![Creando contenedor](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio9-Imagen1.png)

2. Subimos la imagen anterior

		$ azure storage blob upload Ejercicio9-Imagen1.png iv-imagenes

	![Subiendo imagen al contenedor](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema4/img/Ejercicio9-SubiendoImagen2.png)

	Se puede comprobar que la imagen está subida en este enlace http://oskyar.blob.core.windows.net/iv-imagenes/Ejercicio9-Imagen1.png

3. Subimos a Azure el resultado de la subida de la primera imagen.

		$ azure storage blob upload Ejercicio9-SubiendoImagen2.png iv-imagenes

	Aquí también se puede comprobar que se ha subido al conteneder en Azure 

	http://oskyar.blob.core.windows.net/iv-imagenes/Ejercicio9-SubiendoImagen2.png


4. Creamos un contenedor de archivos de texto plano público

		$ azure storage container create iv-archivos -p blob

5. Archivos subidos al contenedor de archivos:

	http://oskyar.blob.core.windows.net/iv-archivos/Ejercicios1y2.md

	http://oskyar.blob.core.windows.net/iv-archivos/Ejercicios3y4.md

	http://oskyar.blob.core.windows.net/iv-archivos/Ejercicios8-10.md

	y subido al contenedor de imágenes:

	http://oskyar.blob.core.windows.net/iv-imagenes/Ejercicio9-CreandoContenedorArchivos.png


# Ejercicio 10

> ###Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.

```ruby

	#! /usr/bin/ruby

	#Author: oskyar

	# Require the azure rubygem
	require "azure"

	# Create an azure storage blob service object
	azure_blob_service = Azure::BlobService.new

	# List containers
	containers = azure_blob_service.list_containers()
	puts "Hay #{containers.count.to_s} contenedores"
	contContainer=1
	containers.each do |cont|
		File.open('lista_archivos.txt', 'w') do |file|
			blobs = azure_blob_service.list_blobs(cont.name)

			file.puts("\n\"#{cont.name}\" contiene #{blobs.size} archivos:")
			puts("\n#{contContainer}. \"#{cont.name}\" contiene #{blobs.size} archivos:")
			contContainer+=1
			contBlobs=1
			blobs.each do |blob|
				file.puts ("\t#{contBlobs}. " +  blob.name)
				puts ("\t#{contBlobs}. " +  blob.name)
				contBlobs+=1
			end		
		end
		#Upload a blob
		content = File.open('lista_archivos.txt', 'rb') { |file| file.read }
		azure_blob_service.create_block_blob(cont.name, "lista_archivos.txt", content)
	end
```

Para ver el código fuente [pinchar aquí](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema4/ejercicio10.rb)