require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Badge ", with: @employee.Badge_
    fill_in "Badge no", with: @employee.Badge_No
    fill_in "Cost center code", with: @employee.Cost_Center_code
    fill_in "Department", with: @employee.Department
    fill_in "Employee name", with: @employee.Employee_Name
    fill_in "Employee status", with: @employee.Employee_Status
    fill_in "Firstname", with: @employee.Firstname
    fill_in "Hire date", with: @employee.Hire_date
    fill_in "Lastname", with: @employee.Lastname
    fill_in "Termination date", with: @employee.Termination_date
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Badge ", with: @employee.Badge_
    fill_in "Badge no", with: @employee.Badge_No
    fill_in "Cost center code", with: @employee.Cost_Center_code
    fill_in "Department", with: @employee.Department
    fill_in "Employee name", with: @employee.Employee_Name
    fill_in "Employee status", with: @employee.Employee_Status
    fill_in "Firstname", with: @employee.Firstname
    fill_in "Hire date", with: @employee.Hire_date
    fill_in "Lastname", with: @employee.Lastname
    fill_in "Termination date", with: @employee.Termination_date
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
