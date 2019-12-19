class EventGroup < ApplicationRecord
  belongs_to :event
  has_many :event_group_members
  has_many :event_attendees, through: :event_group_members
end
