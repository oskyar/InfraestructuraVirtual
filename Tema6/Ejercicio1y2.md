# Ejercicio 1
-------------

> ### Instalar chef en la máquina virtual que vayamos a usar

* Vamos a usar la máquina creada en Azure (Ubuntu 13.10 con 2 cores y 1,75 GB de RAM)
1. Accedemos a ella mediante ssh, recordamos como es:
	Formato:
		$ ssh usuario@url_maquina_virtual

	Y ahora accedemos a nuestra máquina
        $ ssh oskyar@app-conf2.cloudapp.net
        
        	Ponemos la contraseña y ya estaremos dentro.
        
2. Instalamos Chef en nuestra VM.

		$ curl -L https://www.opscode.com/chef/install.sh | sudo bash
        
     Si os da error es porque has ejecutado el script sin poner **sudo** antes de **bash**.

	![Instalando Chef](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej1-InstalandoChef.png)

# Ejercicio 2
-------------
> ### Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

* Para que sepamos cómo tenemos que tener el árbol de directorios, dejo una captura para que se vea como lo tengo yo (100% funcional).

	![Viendo árbol de directorios](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej2-1.ArbolDeDirectorios.png)

	![Instalando NGINX](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej2-2.ErrorInstalandoNginx.png)


	![NGINX instalado con éxito](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej2-3.NginxInstalado.png)



