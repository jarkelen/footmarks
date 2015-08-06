class FootmarkSerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :home_club_id, :away_club_id
end
