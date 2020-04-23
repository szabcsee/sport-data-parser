require 'rails_helper'

RSpec.describe OutcomeFormatter, :type => :class do
  it "it returns a sorted response data" do
    outcome_formatter = OutcomeFormatter.new
    data              =[Outcome.new(id: 1, description: 'Tennis', market_id: 6),
                      Outcome.new(id: 2, description: 'Hockey', market_id: 6),
                      Outcome.new(id: 3, description: 'Football', market_id: 6),
                      Outcome.new(id: 4, description: 'Golf', market_id: 6)]


    result            = outcome_formatter.get_outcomes_data_by_event_id(data)
    test_items        = result[:items]

    expect(test_items.first.id).to eq(1)
    expect(test_items.second.id).to eq(2)
    expect(test_items.third.id).to eq(3)
    expect(test_items.fourth.id).to eq(4)
    expect(test_items.first.market_id).to eq(6)
    expect(test_items.second.market_id).to eq(6)
    expect(test_items.third.market_id).to eq(6)
    expect(test_items.fourth.market_id).to eq(6)
    expect(test_items.first.description).to eq('Tennis')
    expect(test_items.second.description).to eq('Hockey')
    expect(test_items.third.description).to eq('Football')
    expect(test_items.fourth.description).to eq('Golf')
  end

end