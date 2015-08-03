FactoryGirl.define do
  factory :footmark do
    visit_date          1.day.ago
    away_club_id        2
    ground              "Emirates Stadium"
    street              "Ashburton Grove"
    city                "London"
    result              "1-1"
    season              "2013-2014"
    kickoff             "15:00"
    gate                40000
    ticket_price        35.0
    countfor92          false
    association         :league
    association         :club
  end
end