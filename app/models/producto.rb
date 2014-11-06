class Producto < ActiveRecord::Base
  validates :codigo, length: { in: 1..10 }
  validates :descripcion, length: { in: 1..50 }
end
