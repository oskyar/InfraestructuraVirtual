

package 'emacs'
directory '/home/oskyar/InfraestructuraVirtual/Tema6/chef'
file "/home/oskyar/Documentos/LEEME" do
	owner "oskyar"
	group "oskyar"
	mode 00544
	action :create
	content "Directorio para documentos diversos"
end
