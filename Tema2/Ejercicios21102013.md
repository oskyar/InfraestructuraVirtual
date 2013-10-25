# Ejercicio1
------------

* Primero creamos un namespace con mount (*la opción -m*). 

	sudo unshare -m /bin/bash

* Se crea el directorio donde queremos montar la iso.

	sudo mkdir /mnt/disk

*Se monta la ISO con las siguientes opciones.

	sudo mount -o loop -t iso9660 ~/Dropbox/UNIVERSIDAD/Ingeniería/1º/Aprobadas/TC1/Programa/LogicWorks\ 5.iso /mnt/disk

![captura1](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema2/img/Ejercicio1.png)

