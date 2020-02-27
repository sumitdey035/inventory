class Admin::CategoriesController < ApplicationController
  before_action :set_category

  def index
    @categories = Category.get_all.page(params[:page])
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.get_all.page(params[:page])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: "The category has been created successfully" }
      else
        format.html { render action: "index"}
      end
    end
  end

  def edit
  end

  def update
    @categories = Category.get_all.page(params[:page])
    
    respond_to do |format|
      if @category.update_attributes(category_params)
        format.html { redirect_to admin_categories_path, notice: "The category has been updated successfully" }
      else
        format.html { render action: "index"}
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: "The category has been deleted successfully" }
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :categorized_object) 
  end

  def set_category
    @category = Category.find(params[:id]) if params[:id].present?
  end
end