class FootmarksController < ApplicationController
  
  def index
    if params[:keyword].present?
      @footmarks = Search.for(params[:keyword])
    else
      @q = Footmark.search(params[:q])
      @footmarks = @q.result.order('visit_date DESC').limit(10).page(params[:page])
    end
    
    @clubs = Club.order(:name)
  end
end
