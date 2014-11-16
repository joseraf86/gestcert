require 'fileutils'
DIRECTORIO_RESPALDO = "#{Rails.root.to_path}/respaldos/#{Date.today}"
DIRECTORIO_CERTIFICADOS = "#{Rails.root.to_path}/public"

namespace :certs do
  desc 'Crea un respaldo con todos los certificados que tengan mas de un año de antiguedad'
  task respaldo: :environment do
    # Obtener todos los certificados cuya fecha de recepcion
    # tenga mas de un año de antiguedad (scope :viejo, ver modelo certificado)
    #
    certificados = Certificado.viejo

    crear_directorios

    # Iterar sobre cada uno de los certificados y guardarlos
    # en el directorio de respaldos DIRECTORIO_RESPALDO
    #
    certificados.each do |certificado|
      # Obtener el path del certificado a respaldar
      file_path = "#{DIRECTORIO_CERTIFICADOS}#{certificado.adjunto.url}"

      puts "respaldando certificado: #{file_path}"

      # Construir el path donde se guardara el certificado
      path = "/#{certificado.dir_sucursal}/#{certificado.system_id}.#{certificado.formato}"

      # Crear el respaldo del certificado
      FileUtils.cp(file_path, "#{DIRECTORIO_RESPALDO}#{path}")
    end
    puts "Respaldo generado en la carpeta #{DIRECTORIO_RESPALDO}"
  end

  # Crear los directorios de respaldos si no existen
  #
  def crear_directorios
    # Crear el directorio respaldos
    unless File.exists?("#{Rails.root.to_path}/respaldos/")
      Dir.mkdir "#{Rails.root.to_path}/respaldos/"
    end

    # Crear el subdirecorio de respaldos con la fecha actual año-mes-dia
    unless File.exists?(DIRECTORIO_RESPALDO)
      Dir.mkdir DIRECTORIO_RESPALDO
    end

    # Crear los subdirectorios con las sucursales
    sucursales = Sucursal.all.collect { |sucursal| sucursal.nombre.underscore.gsub(/\s/, '_') }
    sucursales.each do |sucursal|
      Dir.mkdir "#{DIRECTORIO_RESPALDO}/#{sucursal}" unless File.exists?("#{DIRECTORIO_RESPALDO}/#{sucursal}")
    end
  end
end
