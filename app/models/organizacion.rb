class Organizacion < ActiveRecord::Base
  has_many :sucursals

  ALPHANUMERIC_REGEX = /\A[-a-zA-Z0-9]+\z/

  validates :nombre,
            length: { in: 1..255 }

  validates :rif,
            format: { with: ALPHANUMERIC_REGEX },
            length: { in: 1..255 }
end
