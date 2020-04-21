#base_controller.rb
class Api::V1::BaseController < ApplicationController

  respond_to :json

  before_action :load_data_service

  private

  # @param data ApplicationRecord
  def prepare_response_data(objects)
    if objects.first.include? :pos
      objects.sort_by(&:pos)
    end
    [data: objects]
  end

  def load_data_service
    begin
      @sports_data_service = SportsDataService.new
    rescue Exceptions
      respond_with [error: 'This service can not be used from your country', status: 403], status: 403
    end
  end
end
