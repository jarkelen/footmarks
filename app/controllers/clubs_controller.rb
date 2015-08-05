class ClubsController < ApplicationController

  def index
    filter = Array.new
    filter << [:league_country_eq, :clubs_country]
    filter << [:league_eq, :clubs_league]
    set_filter_state(filter)

    @q = Club.search(params[:q])
    @clubs = @q.result.includes(:league).order('league_id, name')
    @clubs = @clubs.limit(10) if params[:q].blank?
    @found = @clubs.count unless @clubs.blank?
    get_form_data
  end

  def new
    @club = Club.new
    get_form_data
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to clubs_path, flash: { success: I18n.t('.club.messages.created') }
    else
      get_form_data
      render action: "new"
    end
  end

  def edit
    @club = Club.find(params[:id])
    get_form_data
  end

  def update
    @club = Club.find(params[:id])

    if @club.update_attributes(club_params)
      redirect_to clubs_path, flash: { success: I18n.t('.club.messages.updated') }
    else
      get_form_data
      render action: "edit"
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    redirect_to clubs_path, flash: { success: I18n.t('.club.messages.removed') }
  end

  private

  def club_params
    params.require(:club).permit(:league_id, :name)
  end

  def get_form_data
    @countries = League.select(:country).distinct.order('country ASC')
    @leagues = League.distinct.order('name ASC')
  end
end
