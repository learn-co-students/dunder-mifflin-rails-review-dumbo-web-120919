class EmployeesController < ApplicationController

    
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(strong_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            @employee.errors.full_messages
        end
    end

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(strong_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            @employee.errors.full_messages
        end
    end

private

def strong_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url)
end

end
