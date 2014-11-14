class User < ActiveRecord::Base
  belongs_to :sucursal

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # :registerable, :trackable, :recoverable, :validatable

  devise :database_authenticatable, :rememberable

  include TheRole::User
  # alias for AR:
  # has_role
  # has_many :pages

  validates :password,
            confirmation: true

  validates :role,
            :name,
            :password,
            :password_confirmation,
            :sucursal,
            presence: true

end
