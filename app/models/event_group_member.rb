class EventGroupMember < ApplicationRecord
  belongs_to :event_group
  belongs_to :event_attendee
end
