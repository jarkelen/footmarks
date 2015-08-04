class FootmarkDecorator < BaseDecorator
  decorates :footmark

  def result
    "#{footmark.goals_home}-#{footmark.goals_away}"
  end
end
