###Indice de contenidos:

[Ejercicio 1](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/EjerciciosRuby.md#ejercicio-1)

[Ejercicio 2](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/EjerciciosRuby.md#ejercicio-2)

[Ejercicio 3](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/EjerciciosRuby.md#ejercicio-3)

[Ejercicio 4](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/EjerciciosRuby.md#ejercicio-4)

[Ejercicio 5](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/EjerciciosRuby.md#ejercicio-5)


#Ejercicio 1
------------

> ###Instalar Ruby y usar ruby --version para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.

* Instalando Ruby, la última versión estable a 3/12/2013 es la 1.9.1

		$ sudo apt-get install ruby1.9.1

* Seguimos instalando...

		$ sudo apt-get install irb rubygems rdoc


#Ejercicio 2
------------

> ###Crear un programa en Ruby que imprima los números desde el 1 hasta otro, contenido en una variable.

* [Script](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/Ejercicio2.rb)

![Ejercicio 2](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio2.png)

* Salida

![Salida ejercicio2](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio2salida.png)


#Ejercicio 3
------------

> ###¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.

	Sí, Ruby no tiene distinción de tipos por lo que podemos crear un array de todo tipo de "tipos" (enteros, cadenas, más arrays dentro...)

* [Script](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/Ejercicio3.rb)

![Ejercicio 3](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio3.png)

* Salida

![Salida ejercicio3](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio3salida.png)


#Ejercicio 4
------------

> ### Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve.

* [Documentación sobre Ruby 1.9.3](http://ruby-doc.org/core-1.9.3) (Aquí he buscado información sobre la cabecera y demás.)

* [Script](https://github.com/oskyar/InfraestructuraVirtual/blob/master/SeminarioRuby/Ejercicio4.rb)

![Ejercicio 4](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio4.png)

* Salida

![Salida ejercicio4](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio4salida.png)



#Ejercicio 5
------------

> ### Ver si está disponible Vagrant como una gema de Ruby e instalarla.

* Busquemos Vagrant

		$ gem search --remote ^Vagrant$ -d

		`^`: indica que debe de empezar por "V" 
		`$`: indica que termina por "t"
		`-d`: muestra información adicional de la gema

	![Buscando Vagrant](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio5-BuscandoVagrant.png)

* Instalándola...

		$ sudo gem install vagrant

	![Buscando Vagrant](https://raw.github.com/oskyar/InfraestructuraVirtual/master/SeminarioRuby/img/Ejercicio5-InstalandoVagrant.png)



**NOTA:** Si da error en la instalación, posiblemente es porque no tienes instalado el paquete -dev de vuestra versión de ruby.


* En tal caso instalamos la última actualización de ruby del repositorio y ya se hace una instalación completa con todos los paquetes necesarios.

		$ sudo apt-get install ruby1.9.3






