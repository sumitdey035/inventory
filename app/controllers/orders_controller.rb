class OrdersController < ApplicationController
  layout "application_frontend"
  before_action :set_order
  before_action :set_order_status, only: [:create]

  def index
    @orders = current_user.orders.desc
  end

  def create
    begin
      puts order_params
      @order = current_user.orders.create(order_params)
      total_price = @order.order_items.set_order_items(params[:order][:product_ids], params[:order][:qtys])    
      @order.total_price = total_price
      @order.final_price = total_price
      @order.save
      redirect_to root_path, notice: "Order placed successfully"
    ensure
      params[:order][:product_ids].each do |product_id| 
        current_user.cart_items.where(product_id: product_id).first.destroy
      end
    end
  end

  def show
  end

  def checkout
    @addresses = current_user.addresses
    @cart_items = current_user.cart_items
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_ids, :qtys, :address_id, :status, :serial)
  end

  def set_order_status
    params[:order][:serial] ||= Time.now.to_i
    params[:order][:status] ||= CONFIG["order_statuses"]["placed"]
 end

  def set_order
    @order = Order.find(params[:id]) if params[:id].present?
  end
end