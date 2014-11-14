class Sucursal < ActiveRecord::Base
  belongs_to :organizacion
  has_many :users
  has_many :certificados

  validates :organizacion,
            presence: true

  validates :nombre,
            length: { in: 1..255 }

  ALPHANUMERIC_REGEX = /\A[-a-zA-Z0-9]+\z/
  validates :rif,
            format: { with: ALPHANUMERIC_REGEX },
            length: { in: 1..255 }

end
