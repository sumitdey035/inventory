class AddressesController < ApplicationController
  layout "application_frontend"
  before_action :set_address

  def index
    @addresses = current_user.addresses
    @address = Address.new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private
  def set_address_params
  end

  def set_address
    @address = CartItem.find(params[:id]) if params[:id].present?
  end
end