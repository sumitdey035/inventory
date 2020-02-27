class CartItemsController < ApplicationController
  layout "application_frontend"
  before_action :set_cart_item
  before_action :set_cart_product

  def index
    @cart_items = current_user.cart_items

    respond_to do |format|
      format.js
    end
  end

  def create
    @cart_item = current_user.cart_items.create(product_id: params[:product_id])
    
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def destroy
    @cart_item.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id]) if params[:id].present?
  end

  def set_cart_product
    @product = Product.find(params[:product_id]) if params[:product_id].present?
  end
end