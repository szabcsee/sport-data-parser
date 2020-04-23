class BaseFormatter
  private

  def prepare_response_data(objects)
    objects = [objects] unless objects.is_a?(Array)
    objects.sort_by(&:position)
    {items: objects, result: 'success'}
  end
end