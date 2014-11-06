class CreateColadas < ActiveRecord::Migration
  def change
    create_table :coladas do |t|
      t.integer :numero
      t.references :certificado, index: true

      t.timestamps
    end
  end
end
