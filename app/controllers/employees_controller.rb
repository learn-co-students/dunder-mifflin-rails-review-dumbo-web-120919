class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    find_employee  
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.create(strong)
    if @employee.valid?
    redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    find_employee
    @dogs = Dog.all
  end

  def update
    find_employee
    @employee.update(strong)
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
    end

  private

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def strong
    strong = params.require(:employee).permit(:first_name, :last_name, :alias, :office, :title, :img_url, :dog_id)
  end

end
