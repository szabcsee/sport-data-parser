class SportFormatter < BaseFormatter

  def get_all_sports_data data
      prepare_response_data(data)
  end

  def get_sport_by_id data
    prepare_response_data(data)
  end


end