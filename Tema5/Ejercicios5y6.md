_Tabla de contenidos_

[TOC]

# Ejercicio 5
-------------

> ### Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

1. Podemos hacerlo mediante el panel de control de azure en el que se puede ver [aquí]() (*Una práctica realizada por mi*)
2. Si queremos hacerlo mediante órdenes hacemos lo siguiente:
	
	1. Comprobamos la lista de imágenes que existe en Azure para instalar en una VM.
            $ azure vm image list

		![Lista de Imágenes en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-1.ListaImagenesAzure.png)
        
    2. Como tenemos que crear una máquina con **Ubuntu** pues escogemos la versión que queramos, yo voy a coger la siguiente.
    
    `b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131015-en-us-30GB`
	
	3. Para saber información sobre la imagen usamos la siguiente orden añadiéndole la versión de ubuntu.
			$ azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131015-en-us-30GB

	![Comprobando imagen de Ubuntu en Azure](https://raw.github.com/oskyar/InfraestructuraVirtual/master/Tema5/img/ej6-2.ComprobandoImagen.png)

# Ejercicio 6
-------------

> ###Usar juju para hacer el ejercicio anterior.



# Ejercicio 7
-------------

> ### Instalar una máquina virtual Ubuntu 12.04 para el hipervisor que tengas instalado.