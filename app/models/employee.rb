require 'securerandom'

class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :event_attendees
  has_many :events, through: :event_attendees

  def self.seed_one(seq)
    ActiveRecord::Base.transaction do
      department_ids = Department.ids

      user = User.new(
        email: "testuser#{seq}@example.com",
        password: SecureRandom.hex
      )
      user.save!

      employee = Employee.new(
        name: "Employee #{seq}",
        department_id: department_ids.sample,
        user_id: user.id
      )
      employee.save!
    end
  end
end
