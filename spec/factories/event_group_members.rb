FactoryBot.define do
  factory :event_group_member do
    event_group_id { 1 }
    event_attendee_id { 1 }
    is_leader { false }
  end
end
