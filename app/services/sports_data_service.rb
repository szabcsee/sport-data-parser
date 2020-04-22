class SportsDataService

  JSON_DATA_URL = 'http://digitalyogis.com/gambling.json'
  #JSON_DATA_URL = 'https://m.betvictor.com/bv_in_play/v2/en-gb/1/mini_inplay.json'

  def initialize
    @json_object = retrieve_json_data
  end

  def get_all_sports_data
    items = []
    @json_object['sports'].each do |sport|
      items.push(create_sport_object(sport))
    end
    return items
  end

  def get_sport_data_by_sport_id(id)
    @json_object['sports'].each do |sport|
      return create_sport_object sport if sport['id'].to_i == id
    end
  end

  def get_all_events_data
    event_collection = []
    @json_object['sports'].each do |sport|
      sport['comp'].each do |competition|
        competition['events'].each do |event|
          event = create_event_object(event, competition['id'])
          event_collection.push(event)
        end
      end
    end
    return event_collection
  end

  def get_event_data_by_id(id)
    @json_object['sports'].each do |sport|
      sport['comp'].each do |competition|
        competition['events'].each do |event|
          return create_event_object(event, competition['id']) if event['id'].to_i == id
        end
      end
    end
  end

  def get_event_data_by_sport_id(id)
    event_collection = []
    @json_object['sports'].each do |sport|
      if sport['id'].to_i == id
        sport['comp'].each do |competition|
          competition['events'].each do |event|
            event_collection.push(create_event_object(event, competition['id']))
          end
        end
      end
    end
    return event_collection
  end

  def get_outcomes_data_by_event_id(event_id)
    outcome_collection = []
    @json_object['sports'].each do |sport|
      sport['comp'].each do |competition|
        competition['events'].each do |event|
          if event['id'].to_i == event_id
            event['markets'].each do |market|
              market['o'].each do |outcome|
                outcome_collection.push(Outcome.new(id: outcome['oid'], market_id: market['id'], description: outcome['d']))
              end
            end
          end
        end
      end
    end
    return outcome_collection
  end


  private

  def create_sport_object(sport)
    Sport.new(id: sport['id'], position: sport['pos'], description: sport['desc'])
  end

  def create_event_object(event, competitionId)
    Event.new(id: event['id'], competition_id: competitionId, position: event['pos'], description: event['desc'])
  end

  def retrieve_json_data
    response = HTTParty.get(JSON_DATA_URL)

    if response.code == 403
      raise Exceptions::CountryNotAllowed
    elsif  response.code == 504
      raise Exceptions::RequestTimeout
    end
    JSON.parse(response.body)

  end
end