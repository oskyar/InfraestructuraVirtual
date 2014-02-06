
# Ejercicio 5
-------------

> ### Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

1. Podemos hacerlo mediante el panel de control de azure en el que se puede ver [aquí](https://github.com/oskyar/Practica3-VirtualMachine/blob/master/documentacion/documentacion.md#1-empezaremos-creando-la-m%C3%A1quina-virtual-desde-la-p%C3%A1gina-de-azure-ya-que-es-m%C3%A1s-atractivo-e-intuitivo) (*Una práctica realizada por mi*)
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
    
    ![Accediendo a la VM](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej5-4.AccediendoVM.png)

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

    * Listar endpoints

       	 $ azure vm endpoint show <nombreMaquina>

    * Borrar endpoint

        	$ azure vm endpoint delete <nombre-EndPoint>



# Ejercicio 6
-------------

> ###Usar juju para hacer el ejercicio anterior.

1. Debemos recordar cómo se instala juju en caso de haberlo desinstalado, [¿Cómo se instala?](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/Ejercicios6y7.md#ejercicio-6).

2. Voy a seguir los pasos del compañero @josecolella, [su ejercicio](https://github.com/josecolella/GII-2013/blob/master/Ejercicios/13012014/Clase13012014(JoseColella).md#ejercicio-6), ya que está bien explicado y es corto el proceso. (Me remitiré a los pasos, para las explicaciones ir a su ejercicio).
	
	1. Inicializamos juju
	
    		$ sudo juju init
            
    2. Creamos certificados para **azure** con **openssl**
    
    		$ openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
            $ openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
            $ chmod 600 azure.pem
            
     3. Obtenemos los datos necesarios para configurar el `environments.yaml`
     	
     	1. Necesitamos `management-subscription-id` de:
     		
            		$ azure account list
                    
        2. También necesitamos `management-certificate-path` de:
        
        			En donde se encuentre creado el certificado `azure.pem`

		3. Y por último necesitamos el `storage-account-name` de:
		
        			$ azure storage account list
                
		4. Indicamos a juju que usaremos Azure
		 
					$ sudo juju switch azure

		5. Guardamos los datos en el archivo `~/.juju/environments.yaml`
		
        6. Como no se puede crear un certificado desde la línea de comandos, vamos a crearlo desde el panel de Azure.
       
         	1. Vamos a **configuración** (en los iconos de la izquierda)
        	2. Una vez dentro, vamos a **certificados de administración**
        	3. Presinamos **Cargar** en el pie de la página.
        	4. Buscamos la ubicación de nuestro `azure.cer` y lo subimos.
        	
		7. Ya podemos crear el entorno con:
				
					$ sudo juju bootstrap
                    
		8. Procedemos a usar `juju-gui`:

					$ sudo juju deploy --to 0 juju-gui

		9. Lo exponemos para poder utilizarlo:
       
       			$ sudo juju expose juju-gui

		10. Para comprobar la dirección que nos ha asignado `juju` la miramos con:

					$ sudo juju status
                
            ![Viendo el estado de la máquina creada con JuJu](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-1.JujuStatus.png)
            
        11. Cogemos la **dirección pública** y ya podemos desde el navegador acceder a la página `juju-azure-nbdocnp2pe.cloudapp.net`

			![Pantallazo de Juju-Gui](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-2.PantallaJujuGui.png)
            
        12. Ponemos la contraseña que está en el atributo `admin-secret` en ==~/.juju/environment.yaml==
        
        	![Juju-Gui get started](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-3.JujuGetStarted.png)
            
        13. Y ya estamos dentro para poder configurar, instalar o desinstalar los charm que queramos.
        
        	![Dentro de Juju-Gui](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-4.juju-gui.png)
		
        14. Peeeero, nos pide que instalemos **NGINX** por lo que buscaremos el charm y lo añadiremos.
        
       	 ![Buscando NGINX](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-5.BuscandoNGINX.png)

		15. Una vez añadido nos vamos a nuestro terminal y comprobamos que se haya añadido el servicio y lo exponemos.
		
        		$ sudo juju status
                $ sudo juju expose nginx
                
          ![Exponiendo y desplegado](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-6.ExpuestoNGINX.png)

		16. Ya faltaría configurar nginx dentro de juju para poder visualizarlo desde el navegador y listo.


# Ejercicio 7
-------------

> ### Instalar una máquina virtual Ubuntu 12.04 para el hipervisor que tengas instalado.