class EventAttendee < ApplicationRecord
  belongs_to :event
  belongs_to :employee
  has_many :event_group_members
end
