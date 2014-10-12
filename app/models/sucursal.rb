class Sucursal < ActiveRecord::Base
  belongs_to :organizacion
  has_many :users
end
