class FootmarkSerializer < ActiveModel::Serializer
  attributes :id, :visit_date, :longitude, :latitude
  has_one :home_club
  has_one :away_club    
end
