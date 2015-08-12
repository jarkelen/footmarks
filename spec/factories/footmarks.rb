FactoryGirl.define do
  factory :footmark do
    visit_date          1.day.ago
    ground              "Emirates Stadium"
    street              "Ashburton Grove"
    city                "London"
    result              "1-1"
    season              "2013-2014"
    kickoff             "15:00"
    gate                40000
    ticket_price        35.0
    countfor92          false
    league_id           2
    association         :home_club
    association         :away_club
  end
end