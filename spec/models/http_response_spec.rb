require 'rails_helper'

RSpec.describe HttpResponse, :type => :model do
  it "is valid with valid attributes" do
    http_response = HttpResponse.new(code: 200, body: 'body')
    expect(http_response).to be_valid
  end

  it "is not valid without a code" do
    http_response = HttpResponse.new(code: nil, body: 'body')
    expect(http_response).to_not be_valid
  end

  it "is not valid without a body" do
    http_response = HttpResponse.new(code: 404, body: nil)
    expect(http_response).to_not be_valid
  end

end