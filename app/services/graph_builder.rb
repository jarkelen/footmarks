class GraphBuilder
  attr_reader :survey

  def initialize(survey)
    @survey = survey
    @height = '600'
  end

  def create_categories_spider(categories)
    norm_scores = Array.new
    current_scores = Array.new

    categories.each do |category|
      norm_scores << SurveyCalculator.new(@survey).get_category_score(category, "norm")
      current_scores << SurveyCalculator.new(@survey).get_category_score(category, "current")
    end

    spider_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(polar: true, type: 'line', height: @height)
      f.pane(size: '80%')
      f.colors(['#C41D21','#1c77bb'])
      f.xAxis(
        categories: categories.map{ |c| [@survey.id,c.id, c.name] },
        tickmarkPlacement: 'on',
        lineWidth: 0,
        labels: {
          style: {
            fontSize: '12px',
            weight: 'bold',
            width: '100%'
          },
          formatter: %|function() {return '<a href="https://' + window.location.hostname + '/dashboards/spiders?level=2&survey_id=' + this.value[0] + '&category_id=' + this.value[1] + '">' + this.value[2] + '</a>';}|.js_code }
        )
      f.yAxis(gridLineInterpolation: 'polygon', lineWidth: 0, min: 0,tickInterval: 1, tickWidth: 20)
      f.tooltip(shared: true, pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>')
      f.series(name: "Gemiddelde van gewenste score", data: norm_scores, pointPlacement: 'on')
      f.series(name: "Gemiddelde van huidige score", data: current_scores, pointPlacement: 'on')
      f.legend(align: 'center', verticalAlign: 'bottom', y: 10, layout: 'vertical')
      f.tooltip(valuePrefix: '',valueSuffix: '')
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
