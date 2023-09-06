class TeachersController < ApplicationController
before_action :authenticate_login!

  def index
    @teachers = Teacher.all
  end

  def show
    
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  

  private
  
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password)
    end 
end
