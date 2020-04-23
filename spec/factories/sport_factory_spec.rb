require 'rails_helper'

RSpec.describe SportFactory, :type => :class do
  it "it returns a valid Outcome object when gets valid data" do
    sport_factory = SportFactory.new
    sport = { 'id' => 1, 'desc' => 'Hockey', 'pos' => 1 }
    result = sport_factory.create(sport)

    expect(result.id).to eq(1)
    expect(result.description).to eq('Hockey')
    expect(result.position).to eq(1)
  end
end