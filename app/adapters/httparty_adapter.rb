class HttpartyAdapter

  def initialize
  end

  def get url
    HTTParty.get(url)
  end
end