class CreateEventAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendees do |t|
      t.integer :event_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
