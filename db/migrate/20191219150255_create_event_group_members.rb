class CreateEventGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_group_members do |t|
      t.integer :event_group_id
      t.integer :event_attendee_id
      t.boolean :is_leader, default: false

      t.timestamps
    end
  end
end
