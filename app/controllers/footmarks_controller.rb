class FootmarksController < ApplicationController
  
  def index
    @q = Footmark.search(params[:q])
    @footmarks = @q.result.order('visit_date DESC').limit(10).page(params[:page])
    @clubs = Club.order(:name)
  end
end
