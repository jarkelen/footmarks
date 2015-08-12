require 'rails_helper'

describe Footmark do
  it { should belong_to(:home_club).class_name('Club').with_foreign_key('home_club_id') }
  it { should belong_to(:away_club).class_name('Club').with_foreign_key('away_club_id') }
  it { should have_many :photos }
  it { should validate_presence_of :league_id }
  it { should validate_presence_of :home_club_id }
  it { should validate_presence_of :away_club_id }
end
