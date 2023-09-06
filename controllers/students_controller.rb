class StudentsController < ApplicationController
  before_action :authenticate_login!

  def index
    @students = Student.all
  end

  def show
    
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  

  private
  
    def student_params
      params.require(:student).permit(:name, :department)
    end
end
