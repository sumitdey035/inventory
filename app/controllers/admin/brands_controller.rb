class Admin::BrandsController < ApplicationController
  before_action :set_brand

  def index
    @brands = Brand.get_all.page(params[:page])
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    @brands = Brand.get_all.page(params[:page])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to admin_brands_path, notice: "The brand has been created successfully" }
      else
        format.html { render action: "index"}
      end
    end
  end

  def edit
  end

  def update
    @brands = Brand.get_all.page(params[:page])
    
    respond_to do |format|
      if @brand.update_attributes(brand_params)
        format.html { redirect_to admin_brands_path, notice: "The brand has been updated successfully" }
      else
        format.html { render action: "index"}
      end
    end
  end

  def destroy
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to admin_brands_path, notice: "The brand has been deleted successfully" }
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :description, :owner_name) 
  end

  def set_brand
    @brand = Brand.find(params[:id]) if params[:id].present?
  end
end