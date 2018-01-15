class FootmarksController < ApplicationController

  def index
    @footmarks = Footmark.limit(10).order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?
    get_home_or_away_clubs
    get_form_data
  end

  def show
    @footmark = Footmark.find(params[:id])
    @visited_league = League.find(@footmark.league_id)
    @current_league = League.find(@footmark.home_club.league.id)
    @photos = @footmark.photos
  end

  def new
    @footmark = Footmark.new
    get_all_clubs
    get_form_data
  end

  def create
    @footmark = Footmark.new(footmark_params)

    if @footmark.save
      redirect_to footmark_path(@footmark), flash: { success: I18n.t('.footmark.messages.created') }
    else
      get_all_clubs
      get_form_data
      render action: "new"
    end
  end

  def edit
    @footmark = Footmark.find(params[:id])
    get_all_clubs
    get_form_data
  end

  def update
    @footmark = Footmark.find(params[:id])

    if @footmark.update_attributes(footmark_params)
      redirect_to footmark_path(@footmark), flash: { success: I18n.t('.footmark.messages.updated') }
    else
      get_all_clubs
      get_form_data
      render action: "edit"
    end
  end

  def destroy
    @footmark = Footmark.find(params[:id])
    @footmark.destroy

    redirect_to footmarks_path, flash: { success: I18n.t('.footmark.messages.removed') }
  end

  private

  def footmark_params
    params.require(:footmark).permit(:nr, :visit_date, :ground, :street, :city, :goals_home, :goals_away,
        :season, :kickoff, :gate, :ticket_price, :countfor92, :home_club_id, :away_club_id, :league_id,
        :programme_link, :ticket_link, photos_attributes: [:id, :url, :footmark_id, :_destroy])
  end

  def get_all_clubs
    @home_clubs = Club.order(:name)
    @away_clubs = Club.order(:name)
  end

  def get_home_or_away_clubs
    @home_clubs = Club.where("id IN (?)", Footmark.select(:home_club_id)).order(:name)
    @away_clubs = Club.where("id IN (?)", Footmark.select(:away_club_id)).order(:name)
  end

  def get_form_data
    @seasons = Footmark.select(:season).distinct.order('season DESC')
    @countries = League.select(:country).distinct.order('country ASC')
    @leagues = League.distinct.order('country, step, name')
  end
end
