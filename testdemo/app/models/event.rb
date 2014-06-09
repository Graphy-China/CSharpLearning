class Event < ActiveRecord::Base
  attr_accessible :name, :description, :is_public, :capacity, :status
  validates_presence_of :name
end
