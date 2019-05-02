class ImageBuilder
  require "net/http"

  def initialize(footmark)
    @footmark = footmark
  end

  def get_photos
    photos = Array.new

    if @footmark.has_photos
      counter = 1
      while counter <= 6
        home = Club.find(@footmark.home_club_id).name.downcase.gsub(" ","")
        away = Club.find(@footmark.away_club_id).name.downcase.gsub(" ","")
        photos << "https://footmarks.blob.core.windows.net/fm-photos/#{home}_v_#{away}_#{@footmark.nr}_#{counter}.jpg"
        counter += 1
      end
    end
    
    photos
  end
end
