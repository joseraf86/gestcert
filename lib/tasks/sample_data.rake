namespace :db do
  desc 'Fill development database with sample data'
  task populate: :environment do

    if Rails.env.development?
      reset_db
      ActiveRecord::Base.transaction do
        make_users
        make_proveedores
        make_certificados
        make_productos
      end
    end
  end
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:seed'].invoke
end

# Crear usuarios dummy
def make_users
  User.create!([
    {name: "jose", password: "jose", password_confirmation: "jose", remember_created_at: nil, role_id: 1, sucursal_id: 2},
    {name: "elisa", password: "elisa", password_confirmation: "elisa", remember_created_at: nil, role_id: 2, sucursal_id: 1},
    {name: "fredys", password: "fredys", password_confirmation: "fredys", remember_created_at: nil, role_id: 3, sucursal_id: 3}
    ])
end

def make_proveedores
  Proveedor.create!([
    {name: "SIDOR", rif: "J-234234", nacional: true},
    {name: "Ferrominera del Orinoco", rif: "J-974327", nacional: true},
    {name: "Materiales ABC", rif: "G-435234", nacional: true},
    {name: "Metales Chuo", rif: "J-876123", nacional: false}
  ])
end

# TODO Crear las coladas con cada certificado y asociar el pdf/jpg
def make_certificados; end

def make_productos
  Producto.create!([
    {codigo: "xd-6744534", descripcion: "Cabillas"},
    {codigo: "c4-564-777", descripcion: "Laminas de metal"}
  ])
end

