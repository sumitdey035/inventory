class ProductsController < ApplicationController
  layout "application_frontend"
  skip_before_action :authenticate_user!
  before_action :set_product
  
  def show
    @price_request = PriceRequest.new
  end

  private
  def set_product
    @product = Product.find(params[:id]) if params[:id].present?
  end
end