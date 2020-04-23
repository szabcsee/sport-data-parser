class HttpResponse
  include ActiveModel::Model
  attr_accessor :code, :body
  validates :code, :body, presence: true
end