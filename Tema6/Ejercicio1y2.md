_Tabla de contenidos_

[TOC]

# Ejercicio 1
-------------

> ### Instalar chef en la máquina virtual que vayamos a usar

* Vamos a usar la máquina creada en Azure (Ubuntu 13.10 con 2 cores y 1,75 GB de RAM)
1. Accedemos a ella mediante ssh, recordamos como es:
		$ ssh user@url_vm
        $ ssh oskyar@app-conf2.cloudapp.net
        
        Ponemos la contraseña y ya estaremos dentro.
        
2. Instalamos Chef en nuestra VM.

		$ curl -L https://www.opscode.com/chef/install.sh | sudo bash
        
     Si os da error es porque has ejecutado el script sin poner **sudo** antes de **bash**.

	![Instalando Chef](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej1-InstalandoChef.png)

# Ejercicio 2
-------------
> ### Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

