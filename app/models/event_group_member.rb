class EventGroupMember < ApplicationRecord
  belongs_to :event_group
  belongs_to :event_attendee

  scope :as_leader, -> { where(is_leader: true) }
end
