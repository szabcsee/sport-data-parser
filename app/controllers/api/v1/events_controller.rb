class EventsController < Api::V1::BaseController
  before_action :load_data_service

  def get_all_events

  end

  def get_events_by_sport_id

  end

  def get_event_by_id

  end

  private

  def event_params
    params.require(:event).permit(:id, :competition_id, :position, :description)
  end

  def load_data_service
    @sports_data_service = SportsDataService.new
  end
end
