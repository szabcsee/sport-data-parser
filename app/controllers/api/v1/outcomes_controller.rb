class Api::V1::OutcomesController < ActionController::API
  before_action :initialize_formatter

  def get_all_outcomes_by_event
    begin
      json_data     = @api_service.get
      outcomes      = @betvictor_data_parser.get_outcomes_data_by_event_id(json_data.body, params['id'].to_i)
      render :json => @formatter.get_outcomes_data_by_event_id(outcomes), :status => :ok

    rescue Exceptions::CountryNotAllowed
      render :json => {error: 'This service can not be used from your country', status: :forbidden, result: 'error'}, :status => :forbidden
    rescue Exceptions::RequestTimeout
      render :json => {error: 'The remote server is busy, the request has timed out.', status: :gateway_timeout, result: 'error'}, :status => :gateway_timeout
    rescue StandardError
      render :json => {error: 'Error', status: :forbidden, result: 'error'}, :status => :forbidden
    end
  end

  private

  def initialize_formatter
    adapter                 = ::HttpartyAdapter.new
    @api_service            = ::ApiService.new adapter
    event_factory           = ::EventFactory.new
    sport_factory           = ::SportFactory.new
    outcome_factory         = ::OutcomeFactory.new
    @betvictor_data_parser  = ::BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    @formatter              = OutcomeFormatter.new
  end

end
