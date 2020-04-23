require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "is valid with valid attributes" do
    event = Event.new(id: 1, position: 6, description: 'Hockey', competition_id: 1)
    expect(event).to be_valid
  end

  it "is not valid without an id" do
    event = Event.new(id: nil, position: 6, description: 'Hockey', competition_id: 1)
    expect(event).to_not be_valid
  end

  it "is not valid without a description" do
    event = Event.new(id: 1, position: 6, description: nil, competition_id: 1)
    expect(event).to_not be_valid
  end

  it "is not valid without a position" do
    event = Event.new(id: 1, position: nil, description: 'Hockey', competition_id: 1)
    expect(event).to_not be_valid
  end

  it "is not valid without a competition_id" do
    event = Event.new(id: 1, position: 1, description: 'Hockey', competition_id: nil)
    expect(event).to_not be_valid
  end
end