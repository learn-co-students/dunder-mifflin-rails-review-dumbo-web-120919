class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def show
    end

    def create
        @employee = Employee.create(employee_params)
        redirect_to employee_path(@employee)
    end

    def edit
        @dogs = Dog.all
    end

    def update
        @employee.update(employee_params)

        redirect_to employee_path(@employee)
    end

    private

    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :img_url, :dog_id, :office)
    end
end
