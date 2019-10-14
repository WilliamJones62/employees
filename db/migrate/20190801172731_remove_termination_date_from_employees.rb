class RemoveTerminationDateFromEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :Termination_date, :string
  end
end
