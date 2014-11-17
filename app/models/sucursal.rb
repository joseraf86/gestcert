class Sucursal < ActiveRecord::Base
  belongs_to :organizacion
  has_many :users
  has_many :certificados

  validates :organizacion,
            presence: true

  validates :nombre,
            length: { in: 1..32 }

  validates :direccion,
            length: { in: 1..255 }
end
