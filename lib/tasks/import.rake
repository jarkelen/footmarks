namespace :footmarks do
  task import: :environment do
    # Get countries
    countries = Array.new
    file = File.open('db/import/countries.csv')
    counter = 1
    file.each do |line|
      if counter > 1
        attributes = line.split(",")
        countries[attributes[0].to_i] = "#{attributes[1]}"
      end
      counter += 1
    end

    file = File.open('db/import/leagues.csv')
    counter = 0
    file.each do |line|
      if counter > 0
        attributes = line.split(",")
        league = League.new

        country = countries[attributes[3].to_i]

        league.id = attributes[0]
        league.name = attributes[1]
        league.step = attributes[2]
        league.country = country
        league.save!
        puts "League #{attributes[1]} added"
      end
      counter += 1
    end

    file = File.open('db/import/clubs.csv')
    counter = 0
    file.each do |line|
      if counter > 0
        attributes = line.split(",")

        league = League.find(attributes[7]) unless attributes[7].blank?
        club = Club.new
        club.id = attributes[0]
        club.name = attributes[1]
        club.league_id = league.id unless league.blank?
        club.save!
        puts "Club #{attributes[1]} added"
      end
      counter += 1
    end

    file = File.open('db/import/vinks.csv')
    counter = 0
    file.each do |line|
      if counter > 0
        attributes = line.split(",")
        if attributes[15] == "1"
          visit = Footmark.new

          goals = attributes[6].split("-")


          visit.nr = attributes[1]
          visit.visit_date = attributes[2]
          visit.ground = attributes[3]
          visit.street = attributes[4].gsub!(/\./,',')
          visit.city = attributes[5]
          visit.goals_home = goals[0].to_i
          visit.goals_away = goals[1].to_i
          visit.season = attributes[7]
          visit.kickoff = attributes[8]
          visit.gate = attributes[9]
          visit.ticket_price = attributes[10]
          visit.countfor92 = attributes[11]
          visit.home_club_id = attributes[13]
          visit.away_club_id = attributes[14]
          visit.programme_link = attributes[19]
          visit.ticket_link = attributes[20]
          visit.longitude = attributes[21]
          visit.latitude = attributes[22]
          visit.league_id = attributes[18]
          visit.save!
          puts "Visit #{visit.street} added"
        end
      end
      counter += 1
    end
  end

end
