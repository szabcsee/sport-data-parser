require 'rails_helper'

RSpec.describe OutcomeFactory, :type => :class do
  it "it returns a valid Outcome object when gets valid data" do
    outcome_factory = OutcomeFactory.new
    outcome = { 'oid' => 1, 'd' => 'Hockey', 'market_id' => 1 }
    result = outcome_factory.create(outcome)

    expect(result.id).to eq(1)
    expect(result.description).to eq('Hockey')
    expect(result.market_id).to eq(1)
  end
end