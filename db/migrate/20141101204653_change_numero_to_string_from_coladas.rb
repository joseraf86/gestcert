class ChangeNumeroToIntegerFromColadas < ActiveRecord::Migration
  def change
    change_column :coladas, :numero, :string
  end
end
