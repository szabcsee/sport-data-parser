class Event < ApplicationRecord
  validates_presence_of :competition_id, :position
end
