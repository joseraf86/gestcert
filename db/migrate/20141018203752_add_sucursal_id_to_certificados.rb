class AddSucursalIdToCertificados < ActiveRecord::Migration
  def change
    add_reference :certificados, :sucursal, index: true
  end
end
