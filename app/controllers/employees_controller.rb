class EmployeesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :build_lists, only: [:new, :edit, :update, :create]

  def missing
    if user_signed_in?
      @employees = []
      employees = Employee.all
      employees.each do |e|
        if e.image.blank?
          # missing photo
          @employees.push(e)
        end
      end
    end
  end

  def send_emails
    if user_signed_in?
      e.send_emails!
    end
  end

  # GET /employees
  def index
    if user_signed_in?
      @employees = Employee.all
    else
      @employees = Employee.where.not(Employee_Status: "Terminated")
    end
  end

  def new
    @employee = Employee.new
  end

# GET /employees/1
  def show
  end

  # GET /employees/1/edit
  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /employees/1
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def import
    Mailbox.import(params[:file])
    redirect_to root_url, notice: "Employee list imported."
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def build_lists
      @status = ["Active", "On Leave", "Terminated"]
      @ccs = ["CO", "GA", "IL", "NJ", "TX"]
      @departments = ["ACC", "COL", "CON", "DEV", "EXEC", "FSV", "LOG", "MIS", "MKT", "OMGT", "PER", "QAS", "RET", "USDA", "WHS"]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:Employee_Status, :Badge_, :Cost_Center_Code, :Department, :Lastname, :Firstname, :Hire_date,
        :Termination_date, :Badge_No, :Employee_Name, :image, :hire_dte, :termination_dte, :phone, :email, :ssn4)
    end
end
