class AddCodigoToProveedors < ActiveRecord::Migration
  def change
    add_column :proveedors, :codigo, :string
  end
end
