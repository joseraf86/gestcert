class Proveedor < ActiveRecord::Base
  self.per_page = 15

  has_many :certificados

  validates :rif,
            :name,
            presence: true

  validates :nacional, inclusion: { in: [true, false] }
end
