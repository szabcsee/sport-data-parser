class SportsDataService

  JSON_DATA_URL = 'http://digitalyogis.com/gambling.json'

  def initialize
    @json_object = retrieve_json_data
  end

  def get_all_sports_data
    items = []
    @json_object['sports'].each do |sport|
      items.push(create_sport_object(sport))
    end

  end

  def get_sport_data_by_sport_id(id)
    @json_object['sports'].each do |sport|
      return create_sport_object sport if sport['id'].to_i == id
    end
  end

  def get_all_events_data

  end

  def get_event_data_by_id

  end

  def get_event_data_by_sport_id

  end

  def get_outcomes_data_by_event_id

  end


  private

  def create_sport_object(sport)
    Sport.new(id: sport['id'], position: sport['pos'], description: sport['desc'])
  end

  def retrieve_json_data
    response = HTTParty.get(JSON_DATA_URL)

    JSON.parse(response.body)
  rescue  => e
    raise ConnectionError(e.to_s)
  end
end