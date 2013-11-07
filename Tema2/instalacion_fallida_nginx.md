Instalación fallida de nginx mediante la descarga de paquetes *.tar.gz

+ Instalamos el paquete build-essential que contiene las librerías necesarias para compilar en c (Tiene librerías de más pero... no importa)

		sudo apt-get install build-essential

+ Descargamos el paquete ***nginx***

		wget http://nginx.org/download/nginx-1.4.3.tar.gz

+ Descomprimimos

		tar xvzf nginx-1.4.3.tar.gz

+ Configuramos e instalamos

		cd nginx-1.4.3.tar.gz
		./configure

		Y ahora nos dirá que nos falta una librería... la descargaremos y la instalaremos

Pero nos dirá que nos falta la librería pcre (Procederemos a descargarla, configurarla e instalarla de igual manera que con nginx)

	wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.21.tar.gz
	tar xvzf pcre-8.21.tar.gz
	cd pcre-8.21
	./configure
	make
	make install

Si probamos a configurar *nginx* nos dirá que nos falta ahora la librería "zlib".
Pasamos a la descarga, descompresión, configuración e instalación.

	wget http://prdownloads.sourceforge.net/libpng/zlib-1.2.8.tar.gz?download
	tar xvzf zlib-1.2.8.tar.gz
	cd zlib-1.2.8
	./configure
	make
	make install


Y ahora ya se puede seguir con la configuración de *nginx*
	Entramos en la carpeta
	./configure
	make
	make install


Pero a mi no me funcionaba, no me instalaba el servicio ni nada, puede ser algún problema con make ó make install que no he querido descrubir por falta de tiempo...

Siguiendo la instalación de Germán Martínez Maldonad me ha funcionado perfectamente. Es el Ejercicio5 [enlace](https://github.com/germaaan/IV_GMM/wiki/Ejercicios-Tema-2)