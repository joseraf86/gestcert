class CreateCertificados < ActiveRecord::Migration
  def change
    create_table :certificados do |t|
      t.string :numero_certificado
      t.string :numero_guia_proveedor
      t.string :numero_codigo_producto
      t.string :numero_colada
      t.string :numero_orden_compra

      t.timestamps
    end
  end
end
