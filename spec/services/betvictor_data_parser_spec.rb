require 'rails_helper'

RSpec.describe BetvictorDataParser, :type => :class do
  it "test get_all_sports_data method" do
    event_factory   = double(EventFactory)
    sport_factory   = double(SportFactory)
    outcome_factory = double(OutcomeFactory)
    sport           = Sport.new(id: 1, position: 1, description: 'Basketball')
    expected         = [sport]


    expect(sport_factory).to receive(:create).and_return(sport)

    betvictor_data_parser = BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    items = betvictor_data_parser.get_all_sports_data('{"sports": [{"id": 1, "pos": 1, "desc": "Basketball"}]}')

    expect(items.first.id).to eq expected.first.id
    expect(items.first.position).to eq expected.first.position
    expect(items.first.description).to eq expected.first.description
  end

  it "test get_sport_data_by_sport_id method" do
    event_factory   = double(EventFactory)
    sport_factory   = double(SportFactory)
    outcome_factory = double(OutcomeFactory)
    sport           = Sport.new(id: 1, position: 1, description: 'Basketball')
    expected        = sport


    expect(sport_factory).to receive(:create).and_return(sport)

    betvictor_data_parser = BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    items = betvictor_data_parser.get_sport_data_by_sport_id('{"sports": [{"id": 1, "pos": 1, "desc": "Basketball"}]}', 1)

    expect(items.id).to eq expected.id
    expect(items.position).to eq expected.position
    expect(items.description).to eq expected.description
  end

  it "test get_outcomes_data_by_event_id method" do
    event_factory   = double(EventFactory)
    sport_factory   = double(SportFactory)
    outcome_factory = double(OutcomeFactory)
    outcome         = Outcome.new(id: 1, market_id: 1, description: 'Win')
    expected        = [outcome]


    expect(outcome_factory).to receive(:create).and_return(outcome)

    betvictor_data_parser = BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    items = betvictor_data_parser.get_outcomes_data_by_event_id('{"sports": [{"id": 1, "comp": [{"events": [{"id": 1, "markets": [{"o": [{"oid": 1, "d": "Win"}]}]      }]}]}]}', 1)

    expect(items.first.id).to eq expected.first.id
    expect(items.first.market_id).to eq expected.first.market_id
    expect(items.first.description).to eq expected.first.description
  end

  it "get_all_events_data" do
    event_factory   = double(EventFactory)
    sport_factory   = double(SportFactory)
    outcome_factory = double(OutcomeFactory)
    event           = Event.new(id: 1, competition_id: 1, position: 6, description: 'Premiere League Final')
    expected        = [event]


    expect(event_factory).to receive(:create).and_return(event)

    betvictor_data_parser = BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    items = betvictor_data_parser.get_all_events_data('{"sports": [{"id": 1, "comp": [{"events": [{"id": 1, "pos": 6, "desc": "Premiere League Final"}]}]}]}')

    expect(items.first.id).to eq expected.first.id
    expect(items.first.position).to eq expected.first.position
    expect(items.first.description).to eq expected.first.description
    expect(items.first.competition_id).to eq expected.first.competition_id
  end

  it "get_event_data_by_id" do
    event_factory   = double(EventFactory)
    sport_factory   = double(SportFactory)
    outcome_factory = double(OutcomeFactory)
    event           = Event.new(id: 1, competition_id: 1, position: 6, description: 'Premiere League Final')
    expected        = event


    expect(event_factory).to receive(:create).and_return(event)

    betvictor_data_parser = BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    items = betvictor_data_parser.get_event_data_by_id('{"sports": [{"id": 1, "comp": [{"events": [{"id": 1, "pos": 6, "desc": "Premiere League Final"}]}]}]}', 1)

    expect(items.id).to eq expected.id
    expect(items.position).to eq expected.position
    expect(items.description).to eq expected.description
    expect(items.competition_id).to eq expected.competition_id
  end

  it "get_event_data_by_sport_id" do
    event_factory   = double(EventFactory)
    sport_factory   = double(SportFactory)
    outcome_factory = double(OutcomeFactory)
    event           = Event.new(id: 1, competition_id: 1, position: 6, description: 'Premiere League Final')
    expected        = [event]


    expect(event_factory).to receive(:create).and_return(event)

    betvictor_data_parser = BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    items = betvictor_data_parser.get_event_data_by_sport_id('{"sports": [{"id": 1, "comp": [{"events": [{"id": 1, "pos": 6, "desc": "Premiere League Final"}]}]}]}', 1)

    expect(items.first.id).to eq expected.first.id
    expect(items.first.position).to eq expected.first.position
    expect(items.first.description).to eq expected.first.description
    expect(items.first.competition_id).to eq expected.first.competition_id
  end
end


