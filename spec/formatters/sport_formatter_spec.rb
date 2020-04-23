require 'rails_helper'

RSpec.describe SportFormatter, :type => :class do
  it "it returns a sorted response data for get_all_sports_data" do
    sport_formatter = SportFormatter.new
    data            =[Sport.new(id: 1, description: 'Tennis', position: 6),
                      Sport.new(id: 2, description: 'Hockey', position: 2),
                      Sport.new(id: 3, description: 'Football', position: 3),
                      Sport.new(id: 4, description: 'Golf', position: 1)]
    result          = sport_formatter.get_all_sports_data(data)

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
  end

end