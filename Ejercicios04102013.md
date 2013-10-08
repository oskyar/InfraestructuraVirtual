
### Ejercicio 7

> 1. Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

Vamos a utilizar el paquete cgroup-bin ya que nos facilita las cosas.

+   Empezamos creando el grupo para mi usuario con la orden **cgcreate**:
    
        sudo cgcreate -a oskyar -g memory,cpu,cpuacct:ejercicio7

    
    Ahora hemos creado un grupo llamado *ejercicio7* que se va a encargar de controlar la memoria, CPU y de contabilizar el uso de los recursos de la CPU además de dar permiso al usuario ***oskyar*** para poder trabajar con él. 
    
+   A continuación crearemos los 3 subgrupos que nos pide el ejercicio:

        sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/navegador
        sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/editor
        sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/reproductorMusica
    
+   Seguidamente ejecutámos las órdenes con **cgexec** de los grupos para asignar a los procesos un subgrupo

        cgexec -g memory,cpu,cpuacct:ejercicio7/navegador google-chrome &
        sudo cgexec -g memory,cpu,cpuacct:ejercicio7/editor gedit &
        sudo cgexec -g memory,cpu,cpuacct:ejercicio7/reproductorMusica rhythmbox &
    
> 2. Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.

