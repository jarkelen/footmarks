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
    get_form_data
  end

  def show
    @footmark = Footmark.find(params[:id])
  end

  def new
    @footmark = Footmark.new
    get_form_data
  end

  def create
    @footmark = Footmark.new(footmark_params)

    if @footmark.save
      redirect_to footmark_path(@footmark), flash: { success: I18n.t('.footmark.messages.created') }
    else
      get_form_data
      render action: "new"
    end
  end

  def edit
    @footmark = Footmark.find(params[:id])
    get_form_data
  end

  def update
    @footmark = Footmark.find(params[:id])

    if @footmark.update_attributes(footmark_params)
      redirect_to footmark_path(@footmark), flash: { success: I18n.t('.footmark.messages.updated') }
    else
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
        :programme_link, :ticket_link)
  end

  def get_form_data
    @clubs = Club.order(:name)
    @seasons = Footmark.select(:season).distinct.order('season DESC')
  end
end
