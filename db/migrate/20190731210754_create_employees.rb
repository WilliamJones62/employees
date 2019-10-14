class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :Employee_Status
      t.string :Badge_
      t.string :Cost_Center_code
      t.string :Department
      t.string :Lastname
      t.string :Firstname
      t.string :Hire_date
      t.string :Termination_date
      t.string :Badge_No
      t.string :Employee_Name

      t.timestamps
    end
  end
end
