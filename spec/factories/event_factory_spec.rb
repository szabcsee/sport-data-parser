require 'rails_helper'

RSpec.describe EventFactory, :type => :class do
  it "it returns a valid event object when gets valid data" do
    event_factory = EventFactory.new
    event = { 'id' => 1, 'pos' => 6, 'desc' => 'Hockey', 'competition_id' => 1 }
    result = event_factory.create(event)

    expect(result.id).to eq(1)
    expect(result.position).to eq(6)
    expect(result.description).to eq('Hockey')
    expect(result.competition_id).to eq(1)

  end

end