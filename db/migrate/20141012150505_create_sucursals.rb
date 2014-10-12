class CreateSucursals < ActiveRecord::Migration
  def change
    create_table :sucursals do |t|
      t.string :nombre
      t.references :organizacion, index: true
      t.text :direccion

      t.timestamps
    end
  end
end
