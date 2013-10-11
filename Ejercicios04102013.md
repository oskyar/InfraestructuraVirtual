### Ejercicio 7

> 1) Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

Vamos a utilizar el paquete cgroup-bin ya que nos facilita las cosas.

+   Empezamos creando el grupo para mi usuario con la orden **cgcreate**:
    
        sudo cgcreate -a oskyar -g memory,cpu,cpuacct:ejercicio7

    
    Ahora hemos creado un grupo llamado *ejercicio7* que se va a encargar de controlar la memoria, CPU y de contabilizar el uso de los recursos de la CPU además de dar permiso al usuario ***oskyar*** para poder trabajar con él. 
    
+   A continuación crearemos los 3 subgrupos que nos pide el ejercicio:

        sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/navegador
        sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/editor
        sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/reproductorMusica
    
+   Seguidamente ejecutámos las órdenes con **cgexec** de los subgrupos para asignarle los procesos.

        sudo cgexec -g memory,cpu,cpuacct:reproductorMusica

        sudo cgexec -g memory,cpu,cpuacct:ejercicio7/navegador firefox
        sudo cgexec -g memory,cpu,cpuacct:ejercicio7/editor gedit
        sudo cgexec -g memory,cpu,cpuacct:ejercicio7/reproductorMusica rhythmbox
        
+   Ahora podremos visualizar los resultados accediendo a la carpeta 
*/sys/fs/cgroup/(memory|cpu|cpuacct)/ejercicio7/(navegador|editor|reproductorMusica)*

+   Tabla comparativa entre los procesos:

| Proceso | Memoria¹ | Uso CPU² | Uso CPU0, Uso CPU1³ | Tiempo(Usuario, Sistema)⁴ | 
| :-----: | :-----: | :-: | :-----: | :----: |
|  *Firefox* | 75.272.192  | 479.956.015.509  | 240.714.608.043, 239.241.407.466 | 42468,4636 |
|  *Gedit* |  3.088.384 | 3.377.741.726 | 2.080.746.505, 1.296.995.221| 298, 24 |
|  *Rhythmbox* | 32.219.136  |  17.854.332.789 | 10.944.521.199, 6.909.811.590 | 1561, 261 |

    Análisis de la tabla:
    - ¹Memoria: Memoria consumida en Bytes
    - ²Uso CPU (*cpuacct.stat*) que es el tiempo consumido de sistema y de usuario.
    - ³Uso CPU0 y CPU1 (*cpuacct.usage_percpu*): Tiempo consumido por cada núcleo de la CPU.
    - ⁴Tiempo Usuario y Sistema (*cpuacct.stat*): Tiempo consumido por el usuario y el sistema.
    
+ Aunque me he colado un poco con el tiempo de uso del navegador, voy a calcular el tiempo proporcional con el uso del usuario en todos los procesos.
 
+ Los cálculos son apróximados para ver una semejanza entre procesos.
+ Lo que voy a hacer es, coger los valores del navegador y hacer la proporcion de uso de los otros dos procesos.
    
        gedit = 42468/298 = 142,5  -> lo que haré será multiplicar los valores de la CPU y Sistema por 142,5
        
        *Como memoria no depende del tiempo de uso sino de la cantidad de recursos que necesite el programa, 
        no hago esta proporción.*
    
    Rhythmbox = 42468 / 1561 =  27,2 -> Lo mismo que con gedit.
    
| Proceso | Memoria¹ | Uso CPU² |  Tiempo(Usuario, Sistema)⁴ | 
| :-----: | :-----: | :-: | :-----: | :----: |
|  *Firefox* | 75.272.192  | 479.956.015.509  | 42468,4636 |
|  *Gedit* |  3.088.384 | 481.328.195.955 | 42468, 2993 |
|  *Rhythmbox* | 32.219.136  |  485.637.851.860 | 42468, 7099 |

Con esta aproximación vemos que el reproductor de música frente al editor y navegador necesita más uso de CPU para un mismo tiempo de uso.

