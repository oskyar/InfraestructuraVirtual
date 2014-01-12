#! /usr/bin/ruby

#Author: oskyar

# Require the azure rubygem
require "azure"

# Create an azure storage blob service object
azure_blob_service = Azure::BlobService.new

# List containers
containers = azure_blob_service.list_containers()
puts "Hay #{containers.count.to_s} contenedores"
contContainer=1
containers.each do |cont|
	File.open('lista_archivos.txt', 'w') do |file|
		blobs = azure_blob_service.list_blobs(cont.name)

		file.puts("\n\"#{cont.name}\" contiene #{blobs.size} archivos:")
		puts("\n#{contContainer}. \"#{cont.name}\" contiene #{blobs.size} archivos:")
		contContainer+=1
		contBlobs=1
		blobs.each do |blob|
			file.puts ("\t#{contBlobs}. " +  blob.name)
			puts ("\t#{contBlobs}. " +  blob.name)
			contBlobs+=1
		end		
	end
	#Upload a blob
	content = File.open('lista_archivos.txt', 'rb') { |file| file.read }
	azure_blob_service.create_block_blob(cont.name, "lista_archivos.txt", content)
end