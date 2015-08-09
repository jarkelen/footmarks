class Photo < ActiveRecord::Base
  belongs_to :footmark
  validates :url, :footmark_id, presence: true
end
