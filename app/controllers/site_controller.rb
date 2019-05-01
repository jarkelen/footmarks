class SiteController < ApplicationController

  def tickets
    @footmarks = Footmark.order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?

    get_form_data
  end

  def programmes
    @footmarks = Footmark.order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?

    get_form_data
  end

  def map
    @footmarks = Footmark.includes(:home_club).includes(:away_club).order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?

    respond_to do |format|
      format.html
      format.json { render json: @footmarks, each_serializer: FootmarkSerializer, root: false }
    end
  end

  def the92
    @footmarks = Footmark.where(countfor92: true).order('nr DESC, visit_date DESC')
    @found = @footmarks.count unless @footmarks.blank?
  end

  def leagues_completed
    @ninetytwo = Footmark.where(countfor92: true).count
    @leagues = League.where('step IS NOT NULL AND step < 6').includes(:clubs)
  end

  def visited_clubs
    @clubs = Club.includes(:league).order(:name)
    @iterated_clubs = ClubsIterator.new(@clubs).create_iterations
    @found = @iterated_clubs.count
  end

  def stats
    @leagues_chart = GraphBuilder.new.create_leagues_chart
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
