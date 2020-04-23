require 'rails_helper'

RSpec.describe Exceptions, :type => :class do

  it 'raise CountryNotAllowed Exception' do
    expect { raise Exceptions::CountryNotAllowed }.to raise_error(Exceptions::CountryNotAllowed)
  end

  it 'raise RequestTimeout Exception' do
    expect { raise Exceptions::RequestTimeout }.to raise_error(Exceptions::RequestTimeout)
  end
end