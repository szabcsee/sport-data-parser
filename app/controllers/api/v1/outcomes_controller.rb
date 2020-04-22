class Api::V1::OutcomesController < Api::V1::BaseController

  def get_all_outcomes_by_event
    @outcomes = @sports_data_service.get_outcomes_data_by_event_id(params['id'].to_i)
    render :json => prepare_response_data(@outcomes), :status => :ok
  end

  private

  def outcome_params
    params.require(:outcome).permit(:id, :market_id, :description)
  end

end
