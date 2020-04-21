class Api::V1::SportsController < Api::V1::BaseController

  def get_all_sports
    @sports = @sports_data_service.get_all_sports_data
    respond_with prepare_response_data(@sports)
  end

  def get_sport_by_id
    @sport = @sports_data_service.get_sport_data_by_sport_id(params['id'].to_i)
    respond_with prepare_response_data(@sport)
  end

  private

  def sport_params
    params.require(:sport).permit(:id, :position, :description)
  end

end
