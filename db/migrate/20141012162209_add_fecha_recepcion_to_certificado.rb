class AddFechaRecepcionToCertificado < ActiveRecord::Migration
  def change
    add_column :certificados, :fecha_recepcion, :date
  end
end
