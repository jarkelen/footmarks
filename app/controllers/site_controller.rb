class SiteController < ApplicationController

  def tickets
    filter = Array.new
    filter << [:home_club_league_country_eq, :tickets_league_country]
    filter << [:league_id_eq, :tickets_league_id]
    filter << [:home_club_id_eq, :tickets_home_club_id]
    filter << [:away_club_id_eq, :tickets_away_club_id]
    filter << [:season_eq, :tickets_season]
    set_filter_state(filter)

    @q = Footmark.search(params[:q])
    @footmarks = @q.result.order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?

    get_form_data
  end

  def programmes
    filter = Array.new
    filter << [:home_club_league_country_eq, :programmes_league_country]
    filter << [:league_id_eq, :programmes_league_id]
    filter << [:home_club_id_eq, :programmes_home_club_id]
    filter << [:away_club_id_eq, :programmes_away_club_id]
    filter << [:season_eq, :programmes_season]
    set_filter_state(filter)

    @q = Footmark.search(params[:q])
    @footmarks = @q.result.order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?

    get_form_data
  end

  def map
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

    get_form_data

    respond_to do |format|
      format.html
      format.json { render json: @footmarks, root: false }
    end
  end
  
  def leagues_completed
    @ninetytwo = Footmark.where(countfor92: true).count
    @leagues = League.where('step IS NOT NULL AND step < 6').includes(:clubs).order(:country, :step)
  end

  private

  def get_form_data
    @home_clubs = Club.where("id IN (?)", Footmark.select(:home_club_id)).order(:name)
    @away_clubs = Club.where("id IN (?)", Footmark.select(:away_club_id)).order(:name)
    @seasons = Footmark.select(:season).distinct.order('season DESC')
    @countries = League.select(:country).distinct.order('country ASC')
    @leagues = League.distinct.order('country, step, name')
  end


end
