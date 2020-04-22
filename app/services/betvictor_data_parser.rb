class BetVictorDataParser

  def initialize(sport_factory, event_factory, outcome_factory)
    @sport_factory    = sport_factory
    @event_factory    = event_factory
    @outcome_factory  = outcome_factory
  end

  def get_all_sports_data(data)
    items = []
    parsedData = JSON.parse(data)
    parsedData['sports'].each do |sport|
      items.push(@sport_factory.create(sport))
    end
    return items
  end

  def get_sport_data_by_sport_id(data, id)
    parsedData = JSON.parse(data)
    parsedData['sports'].each do |sport|
      return @sport_factory.create(sport) if sport['id'].to_i == id
    end
  end

  def get_outcomes_data_by_event_id(data, event_id)
    parsedData = JSON.parse(data)
    items = []
    parsedData['sports'].each do |sport|
      sport['comp'].each do |competition|
        competition['events'].each do |event|
          if event['id'].to_i == event_id
            event['markets'].each do |market|
              market['o'].each do |outcome|
                outcome['market_id'] = market['id']
                items.push(@outcome_factory.create(outcome))
              end
            end
          end
        end
      end
    end
    return items
  end

  def get_all_events_data(data)
    parsedData = JSON.parse(data)
    items = []
    parsedData['sports'].each do |sport|
      sport['comp'].each do |competition|
        competition['events'].each do |event|
          event['competition_id'] = competition['id']
          items.push(@event_factory.create(event))
        end
      end
    end
    return items
  end

  def get_event_data_by_id(data, id)
    parsedData = JSON.parse(data)
    parsedData['sports'].each do |sport|
      sport['comp'].each do |competition|
        competition['events'].each do |event|
          event['competition_id'] = competition['id']
          return @event_factory.create(event) if event['id'].to_i == id
        end
      end
    end
  end

  def get_event_data_by_sport_id(data, id)
    parsedData = JSON.parse(data)
    items = []
    parsedData['sports'].each do |sport|
      if sport['id'].to_i == id
        sport['comp'].each do |competition|
          competition['events'].each do |event|
            event['competition_id'] = competition['id']
            items.push(@event_factory.create(event))
          end
        end
      end
    end
    return items
  end
end