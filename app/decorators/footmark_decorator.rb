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

  def ticket
    unless footmark.ticket_link.blank? || footmark.ticket_link == ""
      "<a data-lightbox='flatty' href='#{footmark.ticket_link}'><img src='#{footmark.ticket_link}' width='300px'></a>".html_safe
    end
  end

  def programme
    unless footmark.programme_link.blank? || footmark.programme_link == ""
      "<a data-lightbox='flatty' href='#{footmark.programme_link}'><img src='#{footmark.programme_link}' width='300px'></a>".html_safe
    end
  end

  def photo
    unless footmark.programme_link.blank? || footmark.programme_link == ""
      "<a data-lightbox='flatty' href='#{footmark.programme_link}'><img src='#{footmark.programme_link}' width='250px'></a>".html_safe
    end
  end

  def result
    "#{footmark.goals_home}-#{footmark.goals_away}"
  end

  def league(league)
    step = league.step.blank? ? "-" : league.step
    "[#{step}] #{league.name}"
  end

  def checkmark(item)
    if item == true
      "X"
    else
      "-"
    end
  end

end
