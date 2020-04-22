class Sport
  include ActiveModel::Model
  attr_accessor :id, :description, :position
  validates :id, :position, :description, presence: true
end
