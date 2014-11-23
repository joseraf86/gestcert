namespace :db do
  desc 'Fill development database with sample data'
  task populate: :environment do

    if Rails.env.development?
      reset_db
      ActiveRecord::Base.transaction do
        make_users
        make_certificados
        make_csv_records 'Proveedor'
        make_csv_records 'Producto'
        proveedores_nacionales
      end
    end
  end
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:schema:load'].invoke
  Rake::Task['db:seed'].invoke
end

# Crear usuarios dummy
def make_users
  User.create!([
    {name: "jose", password: "jose", password_confirmation: "jose", remember_created_at: nil, role_id: 3, sucursal_id: 1},
    {name: "elisa", password: "elisa", password_confirmation: "elisa", remember_created_at: nil, role_id: 3, sucursal_id: 2},
    {name: "fredys", password: "fredys", password_confirmation: "fredys", remember_created_at: nil, role_id: 3, sucursal_id: 3},
    {name: "oscar", password: "oscar", password_confirmation: "oscar", remember_created_at: nil, role_id: 3, sucursal_id: 4}
    ])
end

def make_csv_records(object, strict=false)
  require 'csv'
  model = Object.const_get object
  CSV.parse(File.read("#{Rails.root.to_path}/lib/tasks/#{object.downcase.pluralize}.csv"), headers: true).each do |item|
    model.new(item.to_hash).save!(validate: strict)
  end
end

# TODO Crear las coladas con cada certificado y asociar el pdf/jpg
def make_certificados; end


def proveedores_nacionales
  Proveedor.all.each {|proveedor| proveedor.nacional= true; proveedor.save!}
end

