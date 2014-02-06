###[Ejercicios 3 y 4](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/Ejercicios3y4.md)

# Ejercicio 5
-------------

> ### 1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.
> ### 2. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

#####1. Como yo no tengo la asignatura de DAI, voy a utilizar mi aplicación, la que hice para las anteriores prácticas de la asignatura.

1. Creamos un playbook de Ansible, añadiéndole los paquetes necesarios para el funcionamiento de la aplicación, en mi caso necesitaré, MAVEN y el JDK.
	Mis archivos se llamarán **adivinaAdivinanza.yml**, **jdk.yml** y **maven.yml**
    
    Los he separado para que se distinga más que tareas son de cada instalación/configuración.

	Aunque en adivinaAdivinanza.yml están incluidos los otros dos (jdk y maven)
    
	Para ver el contenido es mejor pinchar en **ver** y ver los ficheros, ya que así no lleno de líneas vacías el documento y queda más claro (y bonito).
	
    * [**Ver**](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/adivinaAdivinanza.yml) adivinaAdivinanza.yml
    
    * [**Ver**](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/jdk.yml) jdk.yml
    
    * [**Ver**](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/maven.yml) maven.yml

	Ahora nos falta saber como hacemos funcionar el **playbook** creado. Es tan fácil como escribir:
    
    		$ ansible-playbook adivinaAdivinanza.yml
        
        **Observaciones:** El servidor al que me conecto es **ansible-adivina.cloudapp.net** de Azure (en el playbook queda definido con "_hosts: adivina_" ).
        Para ver ejemplos de algunas las tareas que se pueden crear con ansible-playbook ir [aquí](https://gist.github.com/marktheunissen/2979474)

	Aquí va una captura de la prueba de fuego, comprobando de que el script funciona al 100%.
    ![Aprendiendo a usar ansible-playbook](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej5-1.UsandoPlaybook.png)
    
    ![Aprendiendo a usar ansible-playbook 2](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema6/img/Ej5-2.UsandoPlaybook2.png)
    

###[Ejercicios 7 y 8](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema6/Ejercicios7y8.md)