class OutcomeFormatter < BaseFormatter

  def get_outcomes_data_by_event_id data
    prepare_response_data(data)
  end

  private

  def prepare_response_data(objects)
    objects = [objects] unless objects.is_a?(Array)
    {items: objects, result: 'success'}
  end
end