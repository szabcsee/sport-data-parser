class OutcomeFactory

  def create data
    Outcome.new(id: data['oid'], market_id: data['market_id'], description: data['d'])
  end
end