#base_controller.rb
class Api::V1::BaseController < ApplicationController

  before_action :load_data_service

  private

  def prepare_response_data(objects)
    objects = [objects] unless objects.is_a?(Array)
    if objects.first.has_attribute?(:position)
      objects.sort_by(&:position)
    end
    {items: objects, result: 'success'}
  end

  def load_data_service
    begin
      @sports_data_service = SportsDataService.new
    rescue Exceptions::CountryNotAllowed
      render :json => {error: 'This service can not be used from your country', status: :forbidden, result: 'error'}, :status => :forbidden
    rescue Exceptions::RequestTimeout
      render :json => {error: 'The remote server is busy, the request has timed out.', status: :gateway_timeout, result: 'error'}, :status => :gateway_timeout
    end
  end

end
