class OutcomesController < Api::V1::BaseController
  before_action :load_data_service

  def get_all_outcomes_by_event id

  end

  private

  def outcome_params
    params.require(:outcome).permit(:id, :market_id, :description)
  end

  def load_data_service
    @sports_data_service = SportsDataService.new
  end
end
