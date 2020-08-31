class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to company_path(@employee.company)
    else
      render :new
    end

  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :title, :company_id)
  end
end