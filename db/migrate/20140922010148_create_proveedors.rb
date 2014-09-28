class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :name
      t.string :rif
      t.boolean :nacional

      t.timestamps
    end
  end
end
