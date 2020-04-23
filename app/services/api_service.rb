class ApiService

  #API_URL  = 'http://digitalyogis.com/gambling.json'
  API_URL = 'https://m.betvictor.com/bv_in_play/v2/en-gb/1/mini_inplay.json'

  def initialize http_client
    @http_client = http_client
  end

  def get
    response = @http_client.get API_URL

    if response.code == 403
      raise Exceptions::CountryNotAllowed
    elsif response.code == 504
      raise Exceptions::RequestTimeout
    elsif response.code != 200
      raise StandardError
    end

    return response
  end

end