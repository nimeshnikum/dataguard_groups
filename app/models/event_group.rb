class EventGroup < ApplicationRecord
  belongs_to :event
  has_many :event_group_members
end
