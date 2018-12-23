class Api::FootmarksController < Api::BaseController

  def index
    @footmarks = Footmark.includes(home_club: :league).includes(:away_club).order('nr DESC, visit_date DESC')
    render json: @footmarks, status: 201
  end

  def show
    @footmark = Footmark.find(params[:id])
    render json: @footmark, status: 201
  end
end