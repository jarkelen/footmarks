class Footmark < ActiveRecord::Base
  belongs_to :league
  belongs_to :home_club, class_name: Club, foreign_key: :home_club_id
  belongs_to :away_club, class_name: Club, foreign_key: :away_club_id

  validates :league_id, :home_club_id, presence: true


  def assign_nr
    #vinks = Vink.where("user_id = :user_id and (vink_date < :vink_date)", user_id: vink.user_id, vink_date: vink.vink_date).count + 1
  end
end
