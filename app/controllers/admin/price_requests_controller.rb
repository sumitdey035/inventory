class Admin::PriceRequestsController < ApplicationController
  before_action :set_price_request
  skip_before_action :authenticate_user!

  def index
    @price_requests = PriceRequest.get_all.page(params[:page])
  end

  def new
    @price_request = PriceRequest.new
  end

  def create
    @price_request = PriceRequest.new(price_request_params)
    @price_request.save
  end

  def edit
  end

  private
  def price_request_params
    params.require(:price_request).permit(:name, :email_id, :mobile_no, :query, :product_id) 
  end

  def set_price_request
    @price_request = PriceRequest.find(params[:id]) if params[:id].present?
  end
end