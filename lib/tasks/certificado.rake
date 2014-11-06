require 'fileutils'

namespace :certs do
  desc "Crea un respaldo con todos los certificados que tengan mas de un año de antiguedad"
  task respaldo: :environment do
    # Obtener todos los certificados cuya fecha de recepcion tenga mas de un año de antiguedad
    certificados = Certificado.where( "fecha_recepcion <= ?", Date.today - 1.year)

    # Craer la carpeta de respaldos si no existe
    Dir.mkdir "#{Rails.root.to_path}/respaldos/" unless File.exists?("#{Rails.root.to_path}/respaldos/")
    Dir.mkdir "#{Rails.root.to_path}/respaldos/#{Date.today}" unless File.exists?("#{Rails.root.to_path}/respaldos/#{Date.today}")

    # Iterar sobre cada uno de los certificados y guardarlos en la carpeta de respaldos
    certificados.each do |c|
      file_name = Rails.root.to_path + '/public' + (c.adjunto.url.split '?').first
      puts 'Salvando archivo', file_name
      FileUtils.cp(file_name, "#{Rails.root.to_path}/respaldos/#{Date.today}")
    end

    puts "Respaldo generado en la carpeta #{Rails.root.to_path}/respaldos/#{Date.today}"
  end
end
