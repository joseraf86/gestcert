class AddSystemIdToCertificados < ActiveRecord::Migration
  def change
    add_column :certificados, :system_id, :string
  end
end
