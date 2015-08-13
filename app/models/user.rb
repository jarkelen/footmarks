class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :recoverable
  
  validates :email, :password, :role, presence: true
end
