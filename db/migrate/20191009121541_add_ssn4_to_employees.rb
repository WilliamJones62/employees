class AddSsn4ToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :ssn4, :string
  end
end
