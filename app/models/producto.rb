class Producto < ActiveRecord::Base
  has_paper_trail

  self.per_page = 15

  ALPHANUMERIC_REGEX = /\A[-a-zA-Z0-9]+\z/
  validates :codigo,
            length: { in: 1..10 },
            format: { with: ALPHANUMERIC_REGEX }

  validates :descripcion,
            length: { in: 1..50 }
end
