class Api::V1::EventsController < ActionController::API
  before_action :initialize_formatter

  def get_all_events
    begin
      json_data   = @api_service.get
      events      = @betvictor_data_parser.get_all_events_data(json_data.body)
      render :json => @formatter.get_all_events_data(events), :status => :ok

    rescue Exceptions::CountryNotAllowed
      render :json => {error: 'This service can not be used from your country', status: :forbidden, result: 'error'}, :status => :forbidden
    rescue Exceptions::RequestTimeout
      render :json => {error: 'The remote server is busy, the request has timed out.', status: :gateway_timeout, result: 'error'}, :status => :gateway_timeout
    rescue StandardError
      render :json => {error: 'Error', status: :forbidden, result: 'error'}, :status => :forbidden
    end


  end

  def get_events_by_sport_id
    begin
      json_data   = @api_service.get
      events      = @betvictor_data_parser.get_event_data_by_sport_id(json_data.body, params['id'].to_i)
      render :json => @formatter.get_event_data_by_sport_id(events), :status => :ok

    rescue Exceptions::CountryNotAllowed
      render :json => {error: 'This service can not be used from your country', status: :forbidden, result: 'error'}, :status => :forbidden
    rescue Exceptions::RequestTimeout
      render :json => {error: 'The remote server is busy, the request has timed out.', status: :gateway_timeout, result: 'error'}, :status => :gateway_timeout
    rescue StandardError
      render :json => {error: 'Error', status: :forbidden, result: 'error'}, :status => :forbidden
    end
  end

  def get_event_by_id
    begin
      json_data   = @api_service.get
      event      = @betvictor_data_parser.get_event_data_by_id(json_data.body, params['id'].to_i)

    rescue Exceptions::CountryNotAllowed
      render :json => {error: 'This service can not be used from your country', status: :forbidden, result: 'error'}, :status => :forbidden
    rescue Exceptions::RequestTimeout
      render :json => {error: 'The remote server is busy, the request has timed out.', status: :gateway_timeout, result: 'error'}, :status => :gateway_timeout
    rescue StandardError
      render :json => {error: 'Error', status: :forbidden, result: 'error'}, :status => :forbidden
    end

    render :json => @formatter.get_event_data_by_id(event), :status => :ok
  end

  private

  def initialize_formatter
    adapter                 = ::HttpartyAdapter.new
    @api_service            = ::ApiService.new adapter
    event_factory           = ::EventFactory.new
    sport_factory           = ::SportFactory.new
    outcome_factory         = ::OutcomeFactory.new
    @betvictor_data_parser  = ::BetvictorDataParser.new(sport_factory, event_factory, outcome_factory)
    @formatter              = EventFormatter.new
  end

end
