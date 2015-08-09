class Footmark < ActiveRecord::Base
  belongs_to :home_club, class_name: Club, foreign_key: :home_club_id
  belongs_to :away_club, class_name: Club, foreign_key: :away_club_id
  has_many   :photos

  validates :league_id, :home_club_id, presence: true

  geocoded_by :set_address
  after_validation :geocode

  private

  def set_address
    country = self.home_club.league.country
    "#{street} #{city} #{country}"
  end
end
