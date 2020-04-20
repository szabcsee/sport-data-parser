class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates_presence_of :id, :description
end
