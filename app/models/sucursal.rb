class Sucursal < ActiveRecord::Base
  belongs_to :organizacion
  has_many :users
  has_many :certificados

  validates :organizacion,
            presence: true

  validates :nombre,
            :direccion,
            length: { in: 1..255 }
end
