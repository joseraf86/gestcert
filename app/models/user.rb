class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # :registerable, :trackable, :recoverable, :validatable

  devise :database_authenticatable, :rememberable
end
