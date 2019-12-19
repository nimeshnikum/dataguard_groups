class Event < ApplicationRecord
  has_many :event_attendees
  has_many :employees, through: :event_attendees
  has_many :event_groups

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where("completed IS NULL or completed = ?", false) }
end
