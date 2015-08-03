require 'rails_helper'

describe League do
  it { should have_many :clubs }
  it { should have_many :footmarks }
  it { should validate_presence_of :name       }
end