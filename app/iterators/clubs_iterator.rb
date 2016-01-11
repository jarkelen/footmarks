class ClubsIterator
  attr_reader :clubs

  def initialize(clubs)
    @clubs = clubs
  end

  def create_iterations
    iterated_clubs = Array.new
    unless clubs.blank?
      clubs.each do |club|
        home = club.footmarks.where(home_club_id: club.id).count
        away = club.footmarks.where(away_club_id: club.id).count

        iterated_club = Array.new
        iterated_club << club.name
        iterated_club << home
        iterated_club << away
        iterated_club << home + away
        iterated_clubs << iterated_club
      end
    end
    iterated_clubs
  end
end

