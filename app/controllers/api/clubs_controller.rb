class Api::ClubsController < Api::BaseController
  before_action :set_club, only: [:update, :destroy]

  def index
    @clubs = Club.order(:name)

    render json: @clubs
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      render json: @club, status: :created
    else
      render json: @club.errors, status: :unprocessable_entity
    end
  end

  def update
    if @club.update(club_params)
      render json: @club
    else
      render json: @club.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @club.destroy
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :league_id)
    end