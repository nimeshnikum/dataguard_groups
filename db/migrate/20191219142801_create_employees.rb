class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.integer :department_id
      t.string :name

      t.timestamps
    end

    40.times do |i|
      Employee.seed_one(i)
    end
  end
end
