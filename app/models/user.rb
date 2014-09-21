class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # :registerable, :trackable, :recoverable, :validatable

  devise :database_authenticatable, :rememberable

  include TheRole::User
  # alias for AR:
  # has_role
  # has_many :pages
end
