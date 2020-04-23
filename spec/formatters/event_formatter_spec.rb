require 'rails_helper'

RSpec.describe EventFormatter, :type => :class do
  it "it returns a sorted response data" do
    event_formatter = EventFormatter.new
    data            =[Event.new(id: 1, description: 'Tennis', position: 6, competition_id: 1),
                      Event.new(id: 2, description: 'Hockey', position: 2, competition_id: 1),
                      Event.new(id: 3, description: 'Football', position: 3, competition_id: 1),
                      Event.new(id: 4, description: 'Golf', position: 1, competition_id: 1)]
    result          = event_formatter.get_all_events_data(data)

    test_items = result[:items]
    expect(test_items.first.id).to eq(4)
    expect(test_items.second.id).to eq(2)
    expect(test_items.third.id).to eq(3)
    expect(test_items.fourth.id).to eq(1)
    expect(test_items.first.position).to eq(1)
    expect(test_items.second.position).to eq(2)
    expect(test_items.third.position).to eq(3)
    expect(test_items.fourth.position).to eq(6)
    expect(test_items.first.description).to eq('Golf')
    expect(test_items.second.description).to eq('Hockey')
    expect(test_items.third.description).to eq('Football')
    expect(test_items.fourth.description).to eq('Tennis')
    expect(test_items.first.competition_id).to eq(1)
    expect(test_items.second.competition_id).to eq(1)
    expect(test_items.third.competition_id).to eq(1)
    expect(test_items.fourth.competition_id).to eq(1)
  end

end