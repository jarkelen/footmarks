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
        photos << "https://footmarks.blob.core.windows.net/fm-photos/#{home}_#{@footmark.nr}_#{counter}.jpg"
        counter += 1
      end
    end    
    photos
  end

  def get_ticket
    ticket = nil
    if @footmark.has_ticket
      home = Club.find(@footmark.home_club_id).name.downcase.gsub(" ","").gsub("'","")
      ticket = "https://footmarks.blob.core.windows.net/fm-tickets/#{home}_#{@footmark.nr}.jpg"
    end
    ticket
  end

  def get_programme
    programme = nil
    if @footmark.has_programme
      home = Club.find(@footmark.home_club_id).name.downcase.gsub(" ","").gsub("'","")
      programme = "https://footmarks.blob.core.windows.net/fm-programmes/#{home}_#{@footmark.nr}.jpg"
    end
    programme
  end
end
