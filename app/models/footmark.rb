class Footmark < ApplicationRecord
  belongs_to :home_club, class_name: "Club", foreign_key: :home_club_id
  belongs_to :away_club, class_name: "Club", foreign_key: :away_club_id
  belongs_to :league
  has_many   :photos

  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  validates :league_id, :home_club_id, :away_club_id, presence: true

  geocoded_by :set_address
  after_validation :geocode

  def has_ticket?
    self.has_ticket == true ? true : false
  end

  def has_programme?
    self.has_programme == true ? true : false
  end

  def has_badge?
    self.has_badge == true ? true : false
  end

  private def set_address
    "#{street} #{city}"
  end
end
