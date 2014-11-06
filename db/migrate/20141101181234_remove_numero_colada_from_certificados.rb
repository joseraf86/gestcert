class RemoveNumeroColadaFromCertificados < ActiveRecord::Migration
  def change
    remove_column :certificados, :numero_colada, :string
  end
end
