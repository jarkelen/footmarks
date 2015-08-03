class Search

  def self.for(keyword)
    if is_number?(keyword)
      Footmark.where('nr = ?', keyword.to_i).order("nr DESC")
    else
      keyword_search = "%#{keyword.downcase}%"

      clubs = Club.where('lower(name) LIKE ?', keyword_search).pluck(:id)
      leagues = League.where('lower(name) LIKE ?', keyword_search).pluck(:id)

      footmarks = footmarks.where('club_id IN (?)', clubs) +
              footmarks.where('away_club_id IN (?)', clubs) +
              footmarks.where('league_id IN (?)', leagues) +
              footmarks.where('lower(ground) LIKE ?', keyword_search)

      vinks.sort! { |a,b| b.nr <=> a.nr }
    end
  end

  private

  def self.is_number?(nr)
    true if Integer nr rescue false
  end
end