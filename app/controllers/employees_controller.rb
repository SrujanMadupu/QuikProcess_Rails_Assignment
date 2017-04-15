class EmployeesController < ApplicationController
    
    layout "application"
    
	def index
		list
		render('list')
	end

	def list
		@employees = Employee.all.order("id ASC")
	end

	def show
		@employee = Employee.find(params[:id])
	end	

	def new
        @employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			flash[:success] = "Employee has created Successfully"
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end

	def edit 
		@employee = Employee.find(params[:id])
	end

	def update
        @employee = Employee.find(params[:id])
        if @employee.update_attributes(employee_params)
        	flash[:info] = "Employee has Updated Successfully"
        	redirect_to(:action => 'show',:id => @employee.id)
        else
        	render('edit')
        end
	end

	def delete
        @employee = Employee.find(params[:id])
	end

	def destroy
        employee = Employee.find(params[:id])
        employee.destroy
        flash[:danger] = "Employee #{employee.name} has destroyed Successfully"
        redirect_to(:action => 'list')
	end

	private
		def employee_params
			params.require(:employee).permit(:name,:company,:email,:phone)
		end
end
