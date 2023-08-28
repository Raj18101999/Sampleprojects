class DailController < ApplicationController
  before_action :authenticate_user!

  def index
    @dails = Dail.all
  end

  def product_details
    @all_products = Dail.all
    @all_products_array = @all_products.limit(params[:length]).offset(params[:start]).map { |product| [product.id ,product.categories, product.product, product.rent, product.contact]}
    @all_products_json =  {
    "recordsTotal": @all_products.count,
    "recordsFiltered": @all_products.count,
    "data": @all_products_array
    }
    render json: @all_products_json 
  end

  def create
    @dail = Dail.new(dail_params)
    if @dail.save
      redirect_to action: 'index'
    else
      render 'create_new'
    end
  end

  def new
    @dail = Dail.new
  end

  private
  
    def dail_params
      params.require(:dail).permit(:categories, :product, :rent, :contact)
    end
end
