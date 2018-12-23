class ClubsIterator
  attr_reader :clubs

  def initialize(clubs)
    @clubs = clubs
  end

  def create_iterations
    iterated_clubs = Array.new
    unless clubs.blank?
      clubs.each do |club|
        home = Footmark.where(home_club_id: club.id).count
        away = Footmark.where(away_club_id: club.id).count

        if home > 0 || away > 0
          iterated_club = Array.new
          iterated_club << club.name
          iterated_club << home
          iterated_club << away
          iterated_club << home + away
          iterated_clubs << iterated_club
        end
      end
    end
    iterated_clubs.sort_by! {|item| [-item[3], -item[1], -item[2]] }
  end
end
