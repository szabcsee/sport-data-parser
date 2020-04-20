class Api::V1::SportsController < Api::V1::BaseController
  before_action :load_data_service

  def get_all_sports
    @sports = @sports_data_service.get_all_sports_data
    respond_with @sports
  end

  def get_sport_by_id
    @sports = @sports_data_service.get_sport_data_by_sport_id(params['id'].to_i)
    respond_with @sports
  end

  private

  def sport_params
    params.require(:sport).permit(:id, :position, :description)
  end

  def load_data_service
    @sports_data_service = SportsDataService.new
  end

end
