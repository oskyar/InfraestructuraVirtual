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

1. Voy a mostrar cómo crear la estructura para que chef funcione correctamente y después en el paso 2. explicaré brevemente el contenido de los archivos y para qué sirven.

	1. Para empezar, tenemos que crear una carpeta dónde queramos agregar toda esta estructura. En la raíz de esta estructura crearemos dos ficheros, **node.json** y **solo.rb**, después indicaré su contenido y para que sirven.

	2. Una vez creados los dos archivos en la raíz, añadiremos la estructura para que chef instale las aplicaciones que queramos.
	
    		cookbooks > nombre_aplicacion > recipes
            
	Tal y como veis en la captura del árbol de directorios, habrá que crear tantas como aplicaciones, directorios o archivos queramos crear.
    
    3. Dentro de cada carpeta de la aplicación que queramos instalar, añadiremos un archivo **metadata.rb** en el que se indica, autor, correo, que se va a hacer...
    
    4. Y dentro de la carpeta *recipes* crearemos nuetro último archivo de configuración, llamado **default.rb** el cuál indicará el nombre del paquete de la aplicación para descargarla del repositorio e instalarla.
    
2. Breve explicación de los archivos y su contenido (Enfatizo más los archivos y el nombre porque son muy importantes).

	###**1. solo.rb**  [(ver)](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/chef/solo.rb)
	##### Explicación + Contenido:
    /* Indica la carpeta raíz en donde están los archivos de configuración */
        file_cache_path "/home/oskyar/InfraestructuraVirtual/Tema6/chef"
    /* Indica el path en el que se encuentra el "libro de cocina" */
        cookbook_path "/home/oskyar/InfraestructuraVirtual/Tema6/chef/cookbooks"
    /* Indica dónde se encuentra el archivo con los atributos .json */
        json_attribs "/home/oskyar/InfraestructuraVirtual/Tema6/chef/node.json"

    ###**2. node.json**  [(ver)](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/chef/node.json)
		##### Explicación + Contenido:
	* Aquí indicamos la configuración que va a tener cada aplicación en caso de querer algo específico, y en **run_list** indicamos qué recetas queremos instalar.
    
    **NOTA:** Si en **run_list**  NO está la receta agregada, *chef* no la instalará, aunque tengas la estructura de carpetas creadas, y si es lo contrario, receta agregada pero sin la estructura de carpetas, la instalación dará error.
        
          {
            "proyectosGit": {
            	"name" : "proyectosGit"
            },
            
			"nginx": {
				"user" : "www-data",
				"port"	: "80"
            },
            
			"run_list": [ 
                "recipe[nano]", 
                "recipe[git]", 
                "recipe[proyectosGit]", 
                "recipe[nginx]" 
                ]
          }

 	###**3. metadata.rb**  [(ver)](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/chef/cookbooks/git/metadata.rb)
		##### Explicación + Contenido:
	* Aquí indicamos datos sobre el autor, correo, descripción y la receta que se va a instalar con una descripción.

    **NOTA: ** Si este archivo no existe, la instalación dará error.
    **NOTA2:** Este archivo tiene que estar en todas las carpetas de las aplicaciones que vayamos a instalar, con sus correspondientes cambios (en recipe).

            maintainer "Óscar Zafra"
            maintainer_email "oskyar@gmail.com"
            description "Instala el control de versiones GIT"

            recipe "git", "Receta para instalar GIT"

 	###**4. default.rb**  [(ver)](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/chef/cookbooks/git/recipes/default.rb)
		##### Explicación + Contenido:
		* En este archivo se indican los paquetes que vamos a instalar, en este caso solo git. También necesita uno por aplicación dentro de la carpeta recipes.

    		package git

	* _*Posiblemente se puedan instalar todas las aplicaciones un mismo archivo (metadata y default) y no haya que crear una por aplicación, pero he preferido hacerlo así para que sea más fácil de entender.*_

3. Se procede a la instalación con el siguiente comando (hay que tener permisos de superusuario o ser root)

		$ sudo chef-solo -c ~/InfraestructuraVirtual/Tema6/chef/solo.rb
	
    Si nos sale el siguiente error como en la siguiente imagen, debemos de ejecutar el comando que viene después de la imagen.
    
	![Error al instalar NGINX](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej2-2.ErrorInstalandoNginx.png)

	* Ejecutamos la siguiente orden para que podamos instalar nginx sin errores.
    
    		$ sudo dpkg --configure -a

	* Probamos de nuevo a ejecutar el comando para instalar los programas con chef-solo.

	![NGINX instalado con éxito](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej2-3.NginxInstalado.png)

	Y ya si podemos ver que se ha instalado todo con éxito, (A mi me pone en algunos action install (up to date), esto quiere decir que ya lo tengo instalado y actualizado).
    
* Comprobamos que se han instalado bien los programas, como por ejemplo **nginx** viendo que el *demonio* se puede lanzar y que nos muestra la página de inicio.

* Para iniciar o reiniciar el servicio de **nginx** ejecutamos una de las siguientes órdenes:
	
    **Iniciar:**
    	$ sudo service start nginx
    **Reiniciar:**
		$ sudo service restart nginx
	**Parar:**
    	$ sudo service stop nginx

Y para comprobar que funciona vamos a usar curl para ver la página que establece nginx al arrancar el servidor.

		$ curl localhost
        
![Probando NGINX](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej2-4.ProbandoNginx.png)
