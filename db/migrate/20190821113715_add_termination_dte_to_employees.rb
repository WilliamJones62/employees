class AddTerminationDteToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :termination_dte, :date
  end
end
