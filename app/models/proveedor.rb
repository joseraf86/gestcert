class Proveedor < ActiveRecord::Base

  has_many :certificados

  validates :rif,
            :name,
            presence: true

  validates :nacional, inclusion: { in: [true, false] }
end
