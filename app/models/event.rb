class Event < ApplicationRecord
  has_many :event_attendees
  has_many :employees, through: :event_attendees
  has_many :event_groups
end
