class AddHireDteToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :hire_dte, :date
  end
end
