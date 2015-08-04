class Club < ActiveRecord::Base
  belongs_to :league
  has_many :footmarks

  validates :name, presence: true
end
