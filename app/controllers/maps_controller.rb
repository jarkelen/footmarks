class MapsController < ApplicationController

  def show
    filter = Array.new
    filter << [:home_club_league_country_eq, :map_league_country]
    filter << [:league_id_eq, :map_league_id]
    filter << [:home_club_id_eq, :map_home_club_id]
    filter << [:away_club_id_eq, :map_away_club_id]
    filter << [:season_eq, :map_season]
    set_filter_state(filter)

    @q = Footmark.search(params[:q])
    @footmarks = @q.result.includes(:home_club).includes(:away_club).order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?

    @clubs = Club.order(:name)
    @seasons = Footmark.select(:season).distinct.order('season DESC')
    @countries = League.select(:country).distinct.order('country ASC')
    @leagues = League.distinct.order('country, step, name')

    respond_to do |format|
      format.html
      format.json { render json: @footmarks, root: false }
    end
  end

end
