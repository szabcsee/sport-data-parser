class EventFormatter < BaseFormatter

  def get_all_events_data data
    prepare_response_data(data)
  end

  def get_event_data_by_sport_id data
    prepare_response_data(data)
  end

  def get_event_data_by_id data
    prepare_response_data(data)
  end
end