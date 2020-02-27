class Admin::ProductsController < ApplicationController
  before_action :set_product
  
  def index
    @products = Product.get_all.page(params[:page])
  end

  def new
    @product = Product.new
    @product.pictures.build
  end

  def create
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_admin_product_path(@product), notice: "The product has been created successfully" }
      else
        format.html { render action: "new"}
      end
    end
  end

  def edit 
  end

  def update    
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to admin_products_path, notice: "The product has been updated successfully" }
      else
        format.html { render action: "edit"}
      end
    end
  end
  
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: "The product has been deleted successfully" }
    end
  end

  def upload
    @product.save_pictures(params[:file])

    render :json => {message: "success"}
  end

  private
  def product_params
    params.require(:product).permit(:name, :status, :category_id, :sell_price, :product_type, :sku, :brand_id, 
                                    :description, :place_of_origin, :design, :has_blouse_piece, :current_stock)
  end

  def set_product
    @product = Product.find(params[:id]) if params[:id].present?
  end
end