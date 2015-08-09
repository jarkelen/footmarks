require 'rails_helper'

describe Footmark do
  it { should belong_to :league }
  it { should belong_to :club }
  it { should have_many :photos }
  it { should validate_presence_of :league_id }
  it { should validate_presence_of :club_id }
end
