###[Ejercicios 5 y 6](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/Ejercicios5y6.md)

# Ejercicio 7
-------------

> ### Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

* Vamos a abrir nuestro archivo de configuración Vagrantfile y tan solo vamos a añadir unas líneas:

	* Habrá un bucle con esta estructura:
    
            Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
            	# muchas líneas comentadas
            	# más comentarios
            	.
            	.
            end

	Bien, pues vamos a ir a la línea que pone (**debian-squeeze** es el nombre que le puse a mi maquina)
     
     ~~~
        # Every Vagrant virtual environment requires a box to build off of.
        config.vm.box = "debian-squeeze"
        ~~~
        
	Pues justo debajo añadiremos lo siguiente para que provisione **NGINX** (no hace falta añadir los comentarios)
       
       ~~~
        # Indica que se usará la shell
        config.vm.provision "shell",
        # Con inline podemos usar órdenes de la shell, aquí instalaremos nginx
        inline: "sudo apt-get install -y nginx",
        # Ahora reiniciaremos el servicio para que el demonio se ponga en funcionamiento.
        # En realidad con usar start es más que suficiente porque no se lanzará al instalarse.
        inline: "sudo service nginx restart"
        ~~~
    
    ![Configurando el archivo Vagrantfile](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej7-1.ArchivoVagranfile.png)
    
	Lanzamos VM con (*si no hemos creado la máquina, o descargado la imagen ni instalado vagrant, pinchar [aquí](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/Ejercicios5y6.md#instalar-una-m%C3%A1quina-virtual-debian-usando-vagrant-y-conectar-con-ella)*):
    
    		$ vagrant up
        
    ![Lanzando la máquina](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej7-2.VagrantUP.png)
        
    Y ya podemos provisionar la máquina:

			$ vagrant provision
            
    ![Lanzando la máquina](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej7-3.VagrantProvision.png)
        
        
# Ejercicio 8
-------------

> ###Configurar tu máquina virtual usando vagrant con el provisionador ansible

* Vamos a seguir los mismos pasos que el ejercicio anterior pero ahora añadiendo en el archivo **Vagrantfile** la líneas necesarias para que coja los playbooks de ansible.

	1. Abrimos nuestro archivo Vagrantfile, borramos todo el contenido y añadimos esto:

        ~~~
        VAGRANTFILE_API_VERSION = "2"
        
        Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
          config.vm.box = "debian-ansible"
          config.vm.network :private_network, ip: "192.168.33.11"
          
          config.vm.provision "ansible" do |ansible|
            ansible.playbook = "provisioning/playbook.yml"
            ansible.inventory_path = "provisioning/ansible_hosts"
          
          end
        end
        ~~~
        
* Ahora creamos una carpeta llamada **provisioning** y dentro vamos a guardar el archivo **playbook.yml** con las tareas que deseamos que provisione Vagrant y el archivo **ansible_hosts**

	* El archivo **playbook.yml** contendrá lo siguiente:
        ---
        - hosts: debian
          sudo: yes
          tasks:
          - name: Actualizar
            apt: update_cache=yes
          - name: Instalar el servidor Nginx
            apt: pkg=nginx state=present
          - name: Arrancando el servidor NGINX
            action: shell service nginx start


* Y por último el archivo **ansible_hosts** que tan solo deberá tener la ip que hemos puesto en el archivo de configuración de Vagrantfile
    
    	[debian]
        192.168.33.11

* Ya podemos arrancar la máquina con:
		
        $ vagrant up
        
	![Lanzando la VM con Vagrant](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej8-1.LanzandoMaquina.png)
    
* y provisionarla con:

		$ vagrant provision
        
   ![Aprovisionando la máquina](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej8-2.ProvisionandoVM.png)
   
   
   Para acceder al servidor tan fácil como poner en el navegador la ip que le hemos asignado a la VM: **192.168.33.11**