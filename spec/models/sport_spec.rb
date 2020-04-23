require 'rails_helper'

RSpec.describe Sport, :type => :model do
  it "is valid with valid attributes" do
    sport = Sport.new(id: 1, position: 6, description: 'Hockey')
    expect(sport).to be_valid
  end

  it "is not valid without an id" do
    sport = Sport.new(id: nil, position: 6, description: 'Tennis')
    expect(sport).to_not be_valid
  end

  it "is not valid without a description" do
    sport = Sport.new(id: 1, position: 6, description: nil)
    expect(sport).to_not be_valid
  end

  it "is not valid without a position" do
    sport = Sport.new(id: 1, position: nil, description: 'Baseball')
    expect(sport).to_not be_valid
  end
end