class FootmarksController < ApplicationController

  def index
    @q = Footmark.search(params[:q])
    @footmarks = @q.result.order('visit_date DESC')
    @footmarks = @footmarks.limit(10) if params[:q].blank?
    @found = @footmarks.count unless @footmarks.blank?
    @clubs = Club.order(:name)
  end
end
