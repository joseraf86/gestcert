class CreateOrganizacions < ActiveRecord::Migration
  def change
    create_table :organizacions do |t|
      t.string :nombre
      t.string :rif

      t.timestamps
    end
  end
end
