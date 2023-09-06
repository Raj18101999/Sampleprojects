class SampleController < ApplicationController
  before_action :authenticate_login!

  def new
    @sample = Sample.new
  end

  private
  
    def sample_params
      params.require(:sample).permit(:name, :email, :password)
    end 
end
