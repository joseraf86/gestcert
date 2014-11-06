class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :codigo
      t.text :descripcion

      t.timestamps
    end
  end
end
