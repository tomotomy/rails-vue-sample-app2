class ApiController < ActionController::API
  before_action :set_employee, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    employee = Employee.all
    render json: employees
  end

  def show
    render json: @employee
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end 
end
