class EventFactory

  def create event
    Event.new(id: event['id'], competition_id: event['competition_id'], position: event['pos'], description: event['desc'])
  end

end