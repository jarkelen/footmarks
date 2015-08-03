class Search

  def self.for(keyword, user_id=nil)
    vinks = set_vinks_scope(user_id)

    if is_number?(keyword)
      vinks.where('vink_nr > ? and vink_nr < ?', keyword.to_i - 4, keyword.to_i + 4).order("vink_nr DESC")
    else
      keyword_search = "%#{keyword.downcase}%"

      clubs = Club.where('lower(name) LIKE ?', keyword_search).pluck(:id)
      leagues = League.where('lower(name) LIKE ?', keyword_search).pluck(:id)

      vinks = vinks.where('club_id IN (?)', clubs) +
              vinks.where('away_club_id IN (?)', clubs) +
              vinks.where('league_id IN (?)', leagues) +
              vinks.where('lower(ground) LIKE ?', keyword_search)

      vinks.sort! { |a,b| b.vink_nr <=> a.vink_nr }
    end
  end

  private

  def self.set_vinks_scope(user_id)
    if user_id.blank?
      vinks = Vink
    else
      vinks = User.find(user_id).vinks
    end
    vinks
  end

  def self.is_number?(nr)
    true if Integer nr rescue false
  end
end