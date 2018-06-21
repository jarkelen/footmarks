class Api::FootmarksController < ApplicationController
  def index
    @footmarks = Footmark.includes(home_club: :league).includes(:away_club).order('nr DESC, visit_date DESC')
    render json: @footmarks, status: 201
  end

  def show
    if params[:id].present? and params[:id].to_i > 0
      @dataitem = ToscaDataitem.find(params[:id])
    else
      @dataitem = build_query
    end
    
    if @dataitem.blank?
      @dataitem = {"id": nil,"account_name": "leeg","testblock_name": "leeg","item_name": "leeg","item_description": "leeg","item_value": "leeg"}
    end
    
    render json: @dataitem, status: 201
  end
end