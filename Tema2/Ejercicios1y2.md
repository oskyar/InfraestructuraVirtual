# Ejercicio1
------------

* Primero creamos un namespace con mount (*la opción -m*). 

	sudo unshare -m /bin/bash

* Se crea el directorio donde queremos montar la iso.

	sudo mkdir /mnt/disk

*Se monta la ISO con las siguientes opciones.

	sudo mount -o loop -t iso9660 ~/Dropbox/UNIVERSIDAD/Ingeniería/1º/Aprobadas/TC1/Programa/LogicWorks\ 5.iso /mnt/disk

![captura1](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio1.png)

# Ejercicio2
------------
1. Mostrar los puentes configurados en el sistema operativo.
	Por defecto no hay ningún puente configurado en el sistema operativo, pero como he estado siguiendo los ejemplos y creando nuevos, me aparece alcantara.

![captura2](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/ejercicio%202%20a%29.png)

2. Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

	El puente se crearía con la orden
		> sudo brctl addbr prueba

	Para añadir el puente una interfaz se haría mediante
		> sudo brctl addif prueba wlan0

	Aunque a mi la wlan0 me da error... a la eth0 se puede añadir sin problemas, a no ser que tengas asignado un 
	puente ya a esa interfaz.
	
![captura3](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/ejercicio%202%20b%29.png)