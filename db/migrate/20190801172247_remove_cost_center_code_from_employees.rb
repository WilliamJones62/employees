class RemoveCostCenterCodeFromEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :Cost_Center_code, :string
  end
end
