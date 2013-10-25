### [Ejercicios del 7-9](https://github.com/oskyar/InfraestructuraVirtual/blob/master/Ejercicios04102013.md)

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
