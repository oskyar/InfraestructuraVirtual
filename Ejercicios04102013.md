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


### Ejercicio 8

> 2) Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

La configuración se realiza mediante la edición de los dos archivos siguientes:

    /etc/cgconfig.conf
    Utilizado por libcgroup para definir los grupos de control, sus parámetros y puntos de montaje.

    /etc/cgrules.conf
    Utilizado por libcgroup para definir los grupos de control a la que pertenece el proceso.

A continuación , se inicia el gestor de carga de trabajo y el demonio de reglas:

    service cgconfig restart
    service cgred restart
    + El encargado de la carga de trabajo (cgconfig) es el responsable de la asignación de la Recursos.

También se puede hacer de manera permanente mediante los archivos anteriores o en el momento mediante las siguientes órdenes:

Añade un nuevo proceso para el administrador.
    
    cgexec [- g <controladores> : <path> ] comando [argumentos ]

Añade un proceso que ya se está ejecutando con el administrador:
    
    cgclassify [- g <controladores> : <ruta> ] <pidlist>

O de forma automática sobre el archivo cgrules.conf y el "Demonio de las Reglas cgroup (cgred), lo que obliga a todos los procesos recién generados a entrar en el grupo especificado.
    
    Ejemplo /etc/cgconfig.conf:

    group usuario {
        cpu {
            cpu.shares = 300;
        }
    }

    group root {
        cpu {
            cpu.shares = 700;
        }
    }
    
    mount {
        cpu = /dev/cgroups/cpu;
        cpuacct = /dev/cgroups/cpuacct;
    }
    
Ejemplo /etc/cgrules.conf:

    #<usuario/grupo>    <controlador(es)>    <cgroup>
    oskyar                      cpu           usuario
    root                        cpu            root


Ahora procederíamos a reiniciar los servicios para que éstos utilizaran la nueva configuración. (Como ya puse arriba).

    service cgconfig restart
    service cgred restart


### Ejercicio 9

> Comprobar si el procesador o procesadores instalados lo tienen. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

** Modelo del procesador: **

Mi portátil es el [Asus M60VP](http://www.asus.com/Notebooks_Ultrabooks/M60Vp)
Por lo tanto el modelo del procesador es: [Intel(R) Core(TM) 2 Duo CPU  P8700 @ 2.53Ghz] (http://ark.intel.com/products/37006/)

** En la salida aparece lo siguiente: ** 

![captura1](https://dl.dropboxusercontent.com/u/3216105/virtualizacion%20procesador%20m60vp.png)


**[Características del microprocesador](http://ark.intel.com/products/37006/)**

![captura2](https://dl.dropboxusercontent.com/u/3216105/Caracteristicas%20procesador%20m60vp.png)


### Ejercicio 10

> Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.
	oskyar@oskyar-M60Vp:~/InfraestructuraVirtual$ kvm-ok 
	INFO: /dev/kvm exists
	KVM acceleration can be used


### Ejercicio 12

> Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).

	*** Requisitos: Tener instalado git. ***

He decidido instalarme y probar "rbenv" de Ruby.

**¿Qué se puede hacer?**

Se pueden utilizar varias instalaciones de Ruby, poder intercambiar entre ellas, poder asignar versiones puntuales a proyectos...

**¿Cómo instalarlo?**

Yo he utilizado la última versión descargándomela del [repositorio de git](https://github.com/sstephenson/rbenv#installing-ruby-versions) del creador (Sstephenson).

	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

y agregando las siguientes líneas al archivo ~/.bash_profile

	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"

 + Reiniciar el terminal:

	Forma fácil: Cerrar y abrir otro nuevo.

	Forma pro: ```exec $SHELL -l```

+ Ahora para instalar versiones más fácilmente de Ruby ponemos lo siguiente.

	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

Con esto ya tenemos la opción de install con rbenv.

Veamos las versiones de ruby de la siguiente manera:

	rbenv install --list

Y ahora instalemos la que queramos:

	rbenv install 2.0.0-rc2

Por último la asignamos co		mo versión por defecto global.

	rbenv global 2.0.0-rc2



### Ejercicio 13

Voy a utilizar Heroku ya que he visto que muchos compañeros han utilizado OpenShift y quiero ver distintos PaaS.

Comencemos.

1. Registro:

Entramos en la página de [Heroku](www.heroku.com) y pinchamos en "Sign up"

![captura3](https://dl.dropboxusercontent.com/u/3216105/Heroku/0.%20Creamos%20un%20usuario%20.png)

2. Ahora escribimos nuestro correo electrónico

![captura4](https://dl.dropboxusercontent.com/u/3216105/Heroku/1.%20registrandome%20en%20heroku%20.png)

y le damos a "Sign up".

3. Ahora nos vamos a nuestro correo eletrónico y nos habrá llegado un nuevo correo de Heroku.
Activaremos la cuenta pinchando en el enlace.

![captura5](https://dl.dropboxusercontent.com/u/3216105/Heroku/2.%20correo%20de%20confirmaci%C3%B3n%20Heroku.png)

Y ya tenemos nuestra cuenta creada en una PaaS como Heroku.


### Ejercicio 14

El enlace a mi WordPress con el PaaS OpenShift es el siguiente:

[WordPress by Oscar](http://ejercicio14-oskyar.rhcloud.com)
