class League < ActiveRecord::Base
  has_many :clubs
  has_many :footmarks
  
  validates :name, presence: true
end
