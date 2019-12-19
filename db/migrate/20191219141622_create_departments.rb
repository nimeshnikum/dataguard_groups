class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end

    defaults = %w(
      Management Engineering Sales Finance Legal
    )

    defaults.each { |d| Department.create(name: d) }
  end
end
