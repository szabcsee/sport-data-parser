class Api::V1::SportsController < ActionController::API
  before_action :initialize_formatter

  def get_all_sports

    begin
      json_data   = @api_service.get
      sports      = @betvictor_data_parser.get_all_sports_data(json_data.body)
      render :json => @formatter.get_all_sports_data(sports), :status => :ok

    rescue Exceptions::CountryNotAllowed
      render :json => {error: 'This service can not be used from your country', status: :forbidden, result: 'error'}, :status => :forbidden
    rescue Exceptions::RequestTimeout
      render :json => {error: 'The remote server is busy, the request has timed out.', status: :gateway_timeout, result: 'error'}, :status => :gateway_timeout
    rescue StandardError
      render :json => {error: 'Error', status: :forbidden, result: 'error'}, :status => :forbidden
    end
  end

  def get_sport_by_id

    begin
      json_data   = @api_service.get
      sport       = @betvictor_data_parser.get_sport_data_by_sport_id(json_data.body, params['id'].to_i)
      render :json => @formatter.get_sport_by_id(sport), :status => :ok

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
    @formatter              = SportFormatter.new
  end

end
