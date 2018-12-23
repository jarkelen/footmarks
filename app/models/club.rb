class Club < ApplicationRecord
  belongs_to :league
  has_many :footmarks

  validates :name, :league_id, presence: true
end
