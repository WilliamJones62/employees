class Api::V1::EmployeesController < ApplicationController
  def index
    @employees = Employee.where.not(Employee_Status: "Terminated")
  end
end
