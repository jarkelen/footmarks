class Api::LeaguesController < Api::BaseController
  before_action :set_league, only: [:update, :destroy]

  def index
    @leagues = League.order(:country, :step, :name)

    render json: @leagues
  end

  def create
    @league = League.new(league_params)

    if @league.save
      render json: @league, status: :created
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  def update
    if @league.update(league_params)
      render json: @league
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @league.destroy
  end

  private
    def set_league
      @league = League.find(params[:id])
    end

    def league_params
      params.require(:league).permit(:country, :name, :step)
    end