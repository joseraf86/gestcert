class ChangeSystemIdToStringFromCertificados < ActiveRecord::Migration
  def change
    change_column :certificados, :system_id, :string
  end
end
