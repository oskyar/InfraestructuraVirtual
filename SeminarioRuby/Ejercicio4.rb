#! /usr/bin/ruby

require 'net/http'

def fecha(url)
	salida = Net::HTTP.get_response  url, '/'
	puts "Fecha: #{salida['date'].to_s}\n"
end

def codificacion(url)
	salida = Net::HTTP.get_response  url, '/'
	puts "Codificacion caracteres: " << salida['content-type'].to_s
end

def cabecera(url)
	salida = Net::HTTP.get_response  url, '/'
	
	puts "\nAtributos de la cabecera:"
	salida.to_hash.each do |clave, valor|
		puts "\t#{clave}: #{valor}"
	end
end

url = ARGV[0]
puts "La url es " << url << "\n\n"

fecha(url)
codificacion(url)
cabecera(url)
