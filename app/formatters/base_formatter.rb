class BaseFormatter
  private

  def prepare_response_data(objects)
    objects = [objects] unless objects.is_a?(Array)
    objects = objects.sort! { |a, b|  a.position.to_i <=> b.position.to_i }
    {items: objects, result: 'success'}
  end
end