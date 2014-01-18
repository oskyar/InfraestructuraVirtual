_Tabla de contenidos_

[TOC]

# Ejercicio 5
-------------

> ### Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

1. Podemos hacerlo mediante el panel de control de azure en el que se puede ver [aquí]() (*Una práctica realizada por mi*)
2. Si queremos hacerlo mediante órdenes hacemos lo siguiente:
	
	1. Comprobamos la lista de imágenes que existe en Azure para instalar en una VM.
            $ azure vm image list

		![Lista de Imágenes en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-1.ListaImagenesAzure.png)
        
    2. Como tenemos que crear una máquina con **Ubuntu** pues escogemos la versión que queramos, yo voy a coger la siguiente.
    
    `b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131015-en-us-30GB`
	
	3. Para saber información sobre la imagen usamos la siguiente orden añadiéndole la versión de ubuntu.
			$ azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131015-en-us-30GB

	![Comprobando imagen de Ubuntu en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-2.ComprobandoImagen.png)

3. Creamos la máquina y el usuario

	Formato:
        	$ azure vm create <nombre_maquina> <imagen_maquina> <nombre_usuario> <clave> --location "locate" --ssh

	Orden:
        	$ azure vm create ubuntuNGINX b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131015-en-us-30GB oskyar 123456= --location "West Europe" --ssh

	![Creando Máquina en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-3.CreandoMaquina.png)
    
4. Accedemos a nuestra VM mediante ssh (Tiene que estar ejecutándose, evidentemente)
	
    Formato:
    	$ ssh usuario@direccionServidor
    
    Orden:
    	$ ssh oskyar@ubuntuNGINX.cloudapp.net
        
    Y seguidamente ponemos la contraseña que hayamos puesto al crear la VM.
    
    ![Accediendo a la VM](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-4.AccediendoVM.png)

5. Procedemos a instalar **NGINX** en la VM en Azure (como siempre)
		$ sudo apt-get install nginx

6. Pero hemos cometido un error, y ha sido no configurar el **"EndPoint"** para abrir los puertos del **http**, en este caso el *80* que es el que necesita **NGINX**

	1. Comprobemos qué "**EndPoints**" tenemos configurados
        
        Formato:
				$ azure vm endpoint list <nombreMaquina>
        Orden:
                $ azure vm endpoint list ubuntuNGINX

	 ![Comprobando puntos de acceso](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-5.ComprobandoEndPoints.png)
 
	2. Añadimos el del **HTTP** (Si queremos más información sobre la gestión en línea de comandos en Azure, [pinchar aquí](http://www.windowsazure.com/en-us/documentation/articles/command-line-tools/))

		Formato:
        	$ azure vm endpoint create <nombre-maquina> <Puerto Publico> <Puerto Privado>
            
		Orden:
			$ azure vm endpoint create ubuntuNGINX 80 80
            
        ![Creando EndPoint](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-6.CreandoEndPoint.png)
        
7. Desde la VM tenemos que poner en funcionamiento el servicio NGINX mediante

		$ sudo service nginx start
        
	Nos saldrá el siguiente mensaje si no hay problemas.
        * Starting nginx nginx                           [ OK ]
       
8. Y ya podemos acceder a nuestra VM mediante el navegador y comprobaremos cómo está en funcionamiento el servidor **NGINX**

	![Creando EndPoint](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-7.ComprobandoNGINXenNavegador.png)

10. En caso de querer borrar algún endpoint primero deberemos de saber el nombre del endpoint y después usar la orden para borrarla.
	
    Listar endpoints
		$ azure vm endpoint show <nombreMaquina>
        
    Borrar endpoint
    	$ azure vm endpoint delete <nombre-EndPoint>

# Ejercicio 6
-------------

> ###Usar juju para hacer el ejercicio anterior.




# Ejercicio 7
-------------

> ### Instalar una máquina virtual Ubuntu 12.04 para el hipervisor que tengas instalado.