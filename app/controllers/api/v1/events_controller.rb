class Api::V1::EventsController < Api::V1::BaseController

  def get_all_events
    @events = @sports_data_service.get_all_events_data
    respond_with prepare_response_data(@events)
  end

  def get_events_by_sport_id
    @events = @sports_data_service.get_event_data_by_sport_id(params['id'].to_i)
    respond_with prepare_response_data(@events)
  end

  def get_event_by_id
    @events = @sports_data_service.get_event_data_by_id(params['id'].to_i)
    respond_with prepare_response_data(@events)
  end

  private

  def event_params
    params.require(:event).permit(:id, :competition_id, :position, :description)
  end

end
