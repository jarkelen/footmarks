class GraphBuilder
  attr_reader :survey

  def initialize
    @height = '600'
  end

  def create_leagues_chart
    leagues = Array.new
    League.all.each do |league|
      nr_visits = league.footmarks.where("league_id = ?", league.id).count
      if nr_visits > 0
        leagues << [league.name, nr_visits]
      end
    end
    leagues.sort_by! {|item| [-item[1]] }

    column_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "column"})
      f.pane(size: '80%')
      f.colors(['#2C6700'])
      f.xAxis(
        categories: leagues.map{ |l| [l[0]] },
        labels: {
          rotation: 65
        }
      )
      f.series(name: "Visits", data: leagues, pointPlacement: 'on')
      f.legend(align: 'center', verticalAlign: 'bottom', y: 10, layout: 'vertical')
    end
  end
end


=begin

class GraphBuilder

  def initialize
  end

    @countries = Array.new
  def show_countries(user)
    @countries << ["Country", "Vinks"]
    countries = Country.all
    countries.each do |country|
      @countries << ["#{country.country}", user.vinks.joins(:club).where("clubs.country_id = ?", country.id).count]
    end
    @countries
  end

  def show_leagues(user)
    @leagues = Array.new
    @leagues << ["League", "Vinks"]
    leagues = League.includes(:country).order("country_id, level")
    leagues.each do |league|
      @leagues << ["[#{league.country.country_short}] #{league.name}", user.vinks.where("league_id = ?", league.id).count]
    end
    @leagues
  end

  def show_seasons(user)
    @seasons = Array.new
    @seasons << ["Season", "Vinks"]
    vinks = Vink.order("season").group(:season).count
    vinks.each do |key, value|
      @seasons << [key, value]
    end
    @seasons
  end

  def show_kickoffs(user)
    @kickoffs = Array.new
    @kickoffs << ["Kick-off", "Vinks"]
    vinks = Vink.order("kickoff").group(:kickoff).count
    vinks.each do |key, value|
      @kickoffs << [key, value]
    end
    @kickoffs
  end

  def show_top10_home(user)
    @top10_home = Array.new
    @top10_home << ["Club", "Vinks"]
    vinks = Vink.includes(:club).group(:club_id).order('count_id DESC').limit(10).count('id')
    vinks.each do |key, value|
      club = Club.find(key)
      @top10_home << [club.name, value]
    end
    @top10_home
  end

  def show_top10_away(user)
    @top10_away = Array.new
    @top10_away << ["Club", "Vinks"]
    vinks = Vink.includes(:club).group(:away_club_id).order('count_id DESC').limit(10).count('id')
    vinks.each do |key, value|
      club = Club.find(key)
      @top10_away << [club.name, value]
    end
    @top10_away
  end

  def show_locations(user)
    @locations = Array.new
    @locations << ["Lat", "Long", "Location"]
    vinks = Vink.all
    vinks.each do |key, value|
      if key.latitude.blank?
        puts "EMPTY #{key.ground} - #{key.club.name}"
      else
        @locations << [key.latitude, key.longitude, "#{key.ground} - #{key.club.name}"]
      end
    end
    @locations
  end
 =end
end
=end
