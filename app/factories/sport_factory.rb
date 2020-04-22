class SportFactory

  def create sport
    Sport.new(id: sport['id'], position: sport['pos'], description: sport['desc'])
  end
end