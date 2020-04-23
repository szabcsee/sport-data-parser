require 'rails_helper'

RSpec.describe Outcome, :type => :model do
  it "is valid with valid attributes" do
    outcome = Outcome.new(id: 1, description: 'Win', market_id: 1)
    expect(outcome).to be_valid
  end

  it "is not valid without an id" do
    outcome = Outcome.new(id: nil, description: 'Win', market_id: 1)
    expect(outcome).to_not be_valid
  end

  it "is not valid without a description" do
    outcome = Outcome.new(id: 1, description: nil, market_id: 1)
    expect(outcome).to_not be_valid
  end

  it "is not valid without a market_id" do
    outcome = Outcome.new(id: 1, description: 'Win', market_id: nil)
    expect(outcome).to_not be_valid
  end

end