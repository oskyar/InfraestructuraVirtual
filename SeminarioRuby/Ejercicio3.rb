#! /usr/bin/ruby

#Ejercicio3
#¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.

array_de_arrays = { 
	:numeros => ['uno','dos','tres','cuatro'],
	:colores_semaforo => ['rojo','amarillo','y....','verdeeeee'],
	:automoviles => ['coche','motocicleta','camioneta']
}
puts array_de_arrays.inspect