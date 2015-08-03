class FootmarksController < ApplicationController

  def index
    if params[:keyword].present?
      @footmarks = Search.for(params[:keyword])
    elsif params[:q].present?
      @q = Footmark.search(params[:q])
      @footmarks = @q.result.order('visit_date DESC').limit(10).page(params[:page])
    else
      @q = Footmark.search(params[:q])
      @footmarks = Footmark.order('visit_date DESC').limit(10)
    end

    @clubs = Club.order(:name)
  end
end
