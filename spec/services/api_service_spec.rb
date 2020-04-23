require 'rails_helper'

RSpec.describe BetvictorDataParser, :type => :class do

  it 'test get data' do
    htt_party_adapter      = double(HttpartyAdapter)
    http_client_response   = HttpResponse.new(body: 'Dummy Data', code: 200)
    api_service            = ApiService.new(htt_party_adapter)

    expect(htt_party_adapter).to receive(:get).and_return(http_client_response)
    response = api_service.get
    expect(response.body).to eq(http_client_response.body)
    expect(response.code).to eq(http_client_response.code)
  end

  it 'test get data with unallowed country exception' do
    htt_party_adapter      = double(HttpartyAdapter)
    http_client_response   = HttpResponse.new(body: 'Dummy Data', code: 403)
    api_service            = ApiService.new(htt_party_adapter)

    expect(htt_party_adapter).to receive(:get).and_return(http_client_response)
    expect{raise api_service.get}.to raise_error(Exceptions::CountryNotAllowed)
  end

  it 'test get data with timeout exception' do
    htt_party_adapter      = double(HttpartyAdapter)
    http_client_response   = HttpResponse.new(body: 'Dummy Data', code: 504)
    api_service            = ApiService.new(htt_party_adapter)

    expect(htt_party_adapter).to receive(:get).and_return(http_client_response)
    expect{raise api_service.get}.to raise_error(Exceptions::RequestTimeout)
  end

  it 'test get data with standard error' do
    htt_party_adapter      = double(HttpartyAdapter)
    http_client_response   = HttpResponse.new(body: 'Dummy Data', code: 500)
    api_service            = ApiService.new(htt_party_adapter)

    expect(htt_party_adapter).to receive(:get).and_return(http_client_response)
    expect{raise api_service.get}.to raise_error(StandardError)
  end

end