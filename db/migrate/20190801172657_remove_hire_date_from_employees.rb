class RemoveHireDateFromEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :Hire_date, :string
  end
end
