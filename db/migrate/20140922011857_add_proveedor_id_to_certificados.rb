class AddProveedorIdToCertificados < ActiveRecord::Migration
  def change
    add_reference :certificados, :proveedor, index: true
  end
end
