class HttpartyAdapter

  def initialize
  end

  def get url
    response = HTTParty.get(url)
    http_response = HttpResponse.new(code: response.code, body: response.body)
  end
end