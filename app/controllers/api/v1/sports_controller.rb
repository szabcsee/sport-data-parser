class Api::V1::SportsController < Api::V1::BaseController

  def get_all_sports
    @sports = @sports_data_service.get_all_sports_data
    render :json => prepare_response_data(@sports), :status => :ok
  end

  def get_sport_by_id
    @sport = @sports_data_service.get_sport_data_by_sport_id(params['id'].to_i)
    render :json => prepare_response_data(@sport), :status => :ok
  end

  private

  def sport_params
    params.require(:sport).permit(:id, :position, :description)
  end

end
