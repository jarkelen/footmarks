class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :recoverable
  
  validates :email, :password, :role, presence: true
end
