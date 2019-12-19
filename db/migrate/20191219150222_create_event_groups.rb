class CreateEventGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :event_groups do |t|
      t.integer :event_id
      t.string :name

      t.timestamps
    end
  end
end
