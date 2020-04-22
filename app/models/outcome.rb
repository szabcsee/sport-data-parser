class Outcome
  include ActiveModel::Model
  attr_accessor :id, :description, :market_id
  validates :id, :description, :market_id, presence: true
end
