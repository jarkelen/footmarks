class MapsController < ApplicationController

  def show
    @footmarks = Footmark.includes(:home_club).includes(:away_club).order('nr DESC, visit_date DESC')
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
