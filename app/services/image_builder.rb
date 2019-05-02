class ImageBuilder
  require "net/http"

  def initialize(footmark)
    @footmark = footmark
  end

  def get_photos
    photos = Array.new
    photos << "https://footmarks.blob.core.windows.net/fm-photos/littlehamptontown_v_east_preston_170_1.jpg"
    photos << "https://footmarks.blob.core.windows.net/fm-photos/littlehamptontown_v_east_preston_170_1.jpg"
    photos << "https://footmarks.blob.core.windows.net/fm-photos/littlehamptontown_v_east_preston_170_1.jpg"
    photos << "https://footmarks.blob.core.windows.net/fm-photos/littlehamptontown_v_east_preston_170_1.jpg"
    photos << "https://footmarks.blob.core.windows.net/fm-photos/littlehamptontown_v_east_preston_170_1.jpg"
    photos
    #url = URI.parse("http://www.google.com/")
    #req = Net::HTTP.new(url.host, url.port)
    #res = req.request_head(url.path)
    #do_something_with_it(url) if res.code == "200"
  end
end