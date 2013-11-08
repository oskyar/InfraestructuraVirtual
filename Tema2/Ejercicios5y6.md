### [Ejercicios 3 y 4](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema2/Ejercicios3y4.md)


# Ejercicio5
------------

> ### Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones ***nginx***.

+ Empezamos instalando el programa "debootstrap" si no lo tenemos con:

		sudo apt-get install debootstrap

+ Instalamos un sistema debianita, por ejemplo Ubuntu 13.10 (saucy) con la siguiente orden.

		sudo debootstrap --arch=amd64 saucy /home/jaulas/saucy/ http://archive.ubuntu.com/ubuntu
	
+ Comenzará a descargarnos el sistema minimal de Ubuntu (Saucy - Ubuntu 13.10)

![captura1](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio%203%20a%29%20.png)

Debido a los problemas que he tenido instalando nginx ([enlace a mi instalación fallida](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema2/instalacion_fallida_nginx.md)), he instalado *nginx* como nos indica del compañero  [Germán Martínez Maldonado](https://github.com/germaaan/IV_GMM/wiki/Ejercicios-Tema-2) en el "Ejercicio 5".

Una vez instalado correctamente **nginx** vamos a proceder a la instalación y ejecución de curl para comprobar que el superservidor funciona.

    Instalamos curl para ver el contenido de un html en el terminal

	   apt-get install curl

    Y ahora usamos la siguiente orden para comprobar que el servidor *nginx* está en funcionamiento correctamente.

	   curl localhost

    Monstándonos lo siguiente:

![Imagen Ngnix](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio5-ProbandoNginxConCurl.png)



# Ejercicio6
------------

> ### Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar.

+ Descarga, descompresión, configuración e instalación de jailkit.
        
1. Descarga:
		  
		wget http://olivier.sessink.nl/jailkit/jailkit-2.16.tar.gz
		
2. Descompresión:

		tar xvzf jailkit-2.16.tar.gz

3. Instalación: 

		cd jailkit-2.16
		sudo ./configure && sudo make && sudo make install

4. Instalación de jailkit completada

---------------------------------------------------------------------

#####  `Permisos` root, creación de la `jaula`, creación del `usuario` y enjaulamiento:
> Se hace todo desde la consola del sistema, a ser posible con permisos root para no estar poniendo sudo en todas las órdenes.

1. Creamos el sistema de ficheros con permisos para root.

        	mkdir -p /seguro/jaulas/dorada
        	chown -R root:root /seguro

2. Creamos la jaula con las dependencias/funcionalidades que queramos.

        	jkinit -v -j /seguro/jaulas/dorada jk_lsh basicshell netutils editors

3. Creamos un usuario y lo enjaulamos.

        	adduser user_jk
        	sudo jk_jailuser -m -j /seguro/jaulas/dorada user_jk
	
4.  Editamos la configuracion para permitir a este usuario tener acceso a la shell limitada.

		sudo nano /seguro/jaulas/dorada/etc/passwd

Nos debe quedar algo como esto.

[captura](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio6-configurando_shell_usuario_jaula.png)

> Aquí va un pequeño escript para hacer todo lo anterior de una vez.
>	Script para instalar jaula + usuario...

	sudo mkdir -p /seguro/jaulas/dorada
       sudo chown -R root:root /seguro
       sudo jk_init -v -j /seguro/jaulas/dorada jk_lsh basicshell netutils editors
       sudo adduser user_jk
       sudo jk_jailuser -m -j /seguro/jaulas/dorada user_jk

-----------------------------------------------------------------------
##### Por último nos queda conectarnos con el usuario enjaulado:

        sudo ssh user_jk@localhost
        password: ***
        
![Entrando en la jaula](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio6-entrando-en-la-jaula.png)
