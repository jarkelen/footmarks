class Photo < ApplicationRecord
  belongs_to :footmark
  validates :url, :footmark_id, presence: true
end
