class Colada < ActiveRecord::Base
  belongs_to :certificado
  validates :certificado, presence: true
end
