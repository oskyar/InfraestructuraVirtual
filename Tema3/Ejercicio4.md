# Ejercicio 4
-------------

> Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

* Para instalar lxc-webpanel seguiremos la instalación de la página de [lxc-webpanel](http://lxc-webpanel.github.io/install.html)

	* Instalación (Debemos ser root, por lo que usaremos $ sudo su ) y después... :

			$ wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash

	* [Log de la Instalación](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Tema3/log-Instalacion-Lxc-WebPanel.md)


* Una vez instalado podemos acceder al **lxc-webpanel** mediante un *navegador* poniendo la direccion `localhost:5000`

		> Usuario: admin

		> Contraseña: admin

	Y ya vemos que tenemos una interfaz web para la gestión de contenedores con lxc muy sencilla, intuitiva, amigable, con prácticamente todas las opciones disponibles (me refiero a las que se pueden ejecutar mediante el terminal) y con la certeza de que no vas a poner una orden mal para gestionar *(crear, modificar, configurar, borrar...)* un contenedor.

![Webpanel en el navegador](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio4-WebPanel.png)


* Para lanzar o apagar los contenedores es tan fácil como darle al `play` o `stop` que sale en la pestaña `overview` como se ve en la imagen anterior.

* Se ven como contenedores algunos que no son contenedores, no te preocupes, eso es culpa mía por estar trasteando más de la cuenta las órdenes de lxc.


> 2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

* Para restringir los recursos desde el WebPanel, buscamos a la izquierda `containers` y ahora hacemos click en el contenedor que configurar.

* En mi caso quiero configurar los recursos de `un-contenedor`, así que pincho en `un-contenedor`:

* Nota: si te sale lo siguiente **Network flag UP** (quiere decir que el contenedor está "corriendo") tendrás que parar la ejecución del contenedor para poder aplicarle la nueva configuración.

		- En mi caso he limitado la memoria a 1024 MB

		- La memoria de intercambio  + la memoria a 2048

		- El núcleo que se encargará de este contenedor será el número 1 de los dos que tiene el microprocesador.

![Configuración WEbPanel](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema3/img/Ejercicio4b-Configuracion2-Contenedor-Webpanel.png)

* Hacemos click en Apply y ya tendremos nuestra nueva configuración.

* Nos vamos al principio de la página y pulsamos en `Start` para lanzar el contenedor.

