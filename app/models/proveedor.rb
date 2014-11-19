class Proveedor < ActiveRecord::Base
  has_paper_trail

  self.per_page = 15

  has_many :certificados

  validates :name,
            length: { in: 1..32 }

  ALPHANUMERIC_REGEX = /\A[-a-zA-Z0-9]+\z/
  validates :rif,
            format: { with: ALPHANUMERIC_REGEX },
            length: { in: 1..32 }

  validates :nacional,
            inclusion: { in: [true, false] }

end
