class FootmarksController < ApplicationController

  def index
    filter = Array.new
    filter << [:home_club_id_eq, :footmarks_home_club_id]
    filter << [:away_club_id_eq, :footmarks_away_club_id]
    filter << [:season_eq, :footmarks_season]
    set_filter_state(filter)

    @q = Footmark.search(params[:q])
    @footmarks = @q.result.includes(:home_club).includes(:away_club).order('nr DESC, visit_date DESC')
    @footmarks = @footmarks.limit(10) if params[:q].blank?
    @found = @footmarks.count unless @footmarks.blank?
    @clubs = Club.order(:name)
  end
end
