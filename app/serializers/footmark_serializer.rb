class FootmarkSerializer < ActiveModel::Serializer
  attributes :nr, :visit_date, :ground, :street, :city, :home, :away, :league, :step, :country, :goals_home, :goals_away, :season, :kickoff, :gate, :ticket_price, :programme_link, :ticket_link, :longitude, :latitude

  def visit_date
    object.visit_date.strftime("%d-%m-%Y")
  end

  def home
    club = Club.find(object.home_club_id)
    if club.name.blank?
      "unknown"
    else
      club.name
    end
  end

  def away
    club = Club.find(object.away_club_id)
    if club.name.blank?
      "unknown"
    else
      club.name
    end
  end

  def league
    if object.league_id.blank?
      "unknown"
    else
      League.find(object.league_id).name
    end
  end

  def step
    if object.league_id.blank?
      "unknown"
    else
      League.find(object.league_id).step
    end
  end

  def country
    if object.league_id.blank?
      "unknown"
    else
      League.find(object.league_id).country
    end
  end

end