class Sucursal < ActiveRecord::Base
  belongs_to :organizacion
  has_many :users
  has_many :certificados

  validates :organizacion, presence: true
end
