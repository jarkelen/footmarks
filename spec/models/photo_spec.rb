require 'rails_helper'

describe Photo do
  it { should belong_to :footmark }
  it { should validate_presence_of :url }
  it { should validate_presence_of :footmark_id }
end
