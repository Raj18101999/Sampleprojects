class DailsController < ApplicationController
  before_action :authenticate_login!
  
  
  def index
    @dails = Dail.all
  end

  def show
    @dail = Dail.find(params[:id])
  end

  def new
    @dail = Dail.new
  end

  def create
    @dail = Dail.new(dail_params)
    if @dail.save
      # render json: { product: @dail.product, rent: @dail.rent, contact: @dail.contact }
      # redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    @dail = Dail.find(params[:id])
  end

  def update
    dail = Dail.find(params[:id])
    dail.update(dail_params)
    redirect_to action: 'index'
  end

  def delete
    @dail = Dail.find(params[:id])
    @dail.destroy
    redirect_to  action: 'index'
  end

  private
  
    def dail_params
      params.require(:dail).permit(:categories, :product, :rent, :contact)
    end
end