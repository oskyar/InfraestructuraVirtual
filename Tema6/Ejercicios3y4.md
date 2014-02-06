###[Ejercicios 1 y 2](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/Ejercicios1y2.md)

# Ejercicio 3
-------------

> ### Escribir en YAML la siguiente estructura de datos en JSON.
{ uno: dos, tres: [ 4, 5, Seis, { siete: 8, nueve: [ 10, 11 ] } ] }

* Estructura en JSON identada:

		{
			uno: "dos",
            tres: [
            	4,
                5,
                "Seis", {
                	siete: 8,
                    nueve: [
                    	10,
                        11
					]
				}
			]
		}

* Esta estructura en YAML se puede escribir de varias formas, yo voy a mostrar una.

	    - uno: "dos"
	    tres:
	        - 4
	        - 5
	        - "Seis"
	        -
	          - siete: 8
	            nueve:
	              - 10
	              - 11

Este ejemplo sería una "**lista de arrays asociativos**".

Para saber un poquito más sobre las características de YAML  y ver algunos ejemplos, [pincha aquí](http://es.wikipedia.org/wiki/YAML)

# Ejercicio 4

- - -

> ###Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

* Ansible lo vamos a instalar en un ordenador anfitrión, por ejemplo, nuestro portátil/PC, y desde aquí gestionaremos de forma remota los demás sistemas.
1. Lo primero de todo que vamos a hacer es instalar los paquetes/dependencias necesarias para posteriormente instalar ansible.

	1. Instalamos **pip**.

    		$ sudo apt-get install python-pip

	2. Instalamos **Ansible con pip**

    		$ sudo pip install paramiko PyYAML jinja2 httplib2 ansible

2. Creamos el archivo de inventario y anadiremos la url de nuestros sistemas (en este caso azure). 
    
    * Aquí es dónde guardaremos las URL's para conectarnos con nuestros sistemas remotamente.

    		$ echo "app-conf1.cloudapp.net" >> ~/ansible_hosts
            $ echo "app-conf2.cloudapp.net" >> ~/ansible_hosts
            $ echo "app-conf3.cloudapp.net" >> ~/ansible_hosts

		![Mostrando archivo Ansible Hosts](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej4-0.ArchivoAnsibleHosts.png)
        
        Como podéis ver, le he puesto antes una etiqueta entre corchetes (**[azure]**), esto sirve para poder referirnos a todos las máquinas a la vez que estén dentro de azure.
        
3. **Exportamos** el archivo inventario a una variable **global** para que al ejecutar ansible recoja la información.

        $ export ANSIBLE_HOSTS=~/ansible_hosts

4. Ahora vamos a configurar el acceso mediante ssh, para ello necesitamos enviar nuestra clave **ssh** a nuestros sistema remotos (*solo lo envío al app-conf2 porque es el único que está activo en azure*).

        $ ssh-copy-id -i ~/.ssh/id_rsa.pub oskyar@app-conf2.cloudapp.net

	![Añadiendo Clave SSH a la máquina remota](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej4-1.AnadiendoClaveSSH.png)

5. Ya podemos comprobar si desde la máquina anfitrión se puede acceder a las máquinas externas

        $ ansible all -u oskyar -m ping
            
    ![Comprobando conexión con las máquinas remotamente](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej4-2.ComprobandoConexionHosts.png)
    
    * Como veis me da un error en dos servidores, en mi caso sucede porque el servidor no está arrancado, pero en caso de estar arrancado y que muestre un error similar (color en rojo) puede ser porque no se haya exportado la **clave ssh** a la máquina. (*para proceder a esto, id al paso 4.*).

   *  En cambio, me sale uno con letras de color verde, que es el que tengo activado.

6. Una vez realizados todos los pasos anteriores (de instalación, no hacen falta los de comprobación pero si que vienen bien para verificar que todo está configurado correctamente), vamos a descargarnos de git un repositorio de una aplicación.

	1. Voy a descargarme **SocialCookies**, realizada en el ***Hackaton de Cocorocó****.

    		$ ansible azure -m git -a "repo=https://github.com/IV-GII/SocialCookies.git dest=~/SocialCookies"

	![Clonando repositorio en mi sistema externo remotamente con ansible]( https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej4-4.ClonandoSocialCookies.png)

	* Vemos que pone "**success**" que quiere decir que se ha clonado correctamente.
    * Para poder clonar un repositorio con git hay que indicar el repositorio con **repo**, la carpeta de destino con **dest** y la versión en caso de querer alguna especifica con **version**

En caso de tener todos las máquinas activas dentro del grupo **azure** haría la misma instalación para todas las máquina y de una sola vez, todo un lujo y un ahorro de tiempo ejecutando las mismas órdenes repetidas veces y teniendo que esperar a que alguna instalación se complete para iniciar la siguiente.


###[Ejercicios 5 y 6](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/Ejercicios5y6.md)
