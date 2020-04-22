class Event
  include ActiveModel::Model
  attr_accessor :id, :description, :competition_id, :position
  validates :id, :description, :competition_id, :position, presence: true
end
