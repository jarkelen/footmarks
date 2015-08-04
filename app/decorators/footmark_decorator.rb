class FootmarkDecorator < BaseDecorator
  decorates :footmark

  def result
    "#{footmark.goals_home}-#{footmark.goals_away}"
  end

  def home_club
    footmark.home_club.blank? ? "-" : footmark.home_club.name
  end

  def away_club
    footmark.away_club.blank? ? "-" : footmark.away_club.name
  end

  def flag
    country = footmark.league.country.gsub(' ','').downcase
    image_tag("flags/#{country}.png")
  end
end
