class Admin::CatelogsController < ApplicationController
  before_action :set_catelog
  
  def index
    @catelogs = Catelog.get_all
    @catelog = Catelog.new
    @catelog.pictures.build
  end

  def create
    @catelog = Catelog.new(catelog_params)

    respond_to do |format|
      if @catelog.save
        format.html { redirect_to admin_catelogs_path, notice: "The catelog has been created successfully" }
      else
        @catelog.pictures.build
        format.html { render action: "index"}
      end
    end
  end

  def edit 
  end

  def update    
    respond_to do |format|
      if @catelog.update_attributes(catelog_params)
        format.html { redirect_to admin_catelogs_path, notice: "The catelog has been updated successfully" }
      else
        format.html { render action: "edit"}
      end
    end
  end

  def destroy
    @catelog.destroy

    respond_to do |format|
      format.html { redirect_to admin_catelogs_path, notice: "The catelog has been deleted successfully" }
    end
  end

  def catelog_items
    @products = Product.get_all
    @posts = Post.get_all

    @post_catelog_items     = @catelog.catelog_items.where(collection_type: "posts").map(&:collection_id)
    @product_catelog_items  = @catelog.catelog_items.where(collection_type: "products").map(&:collection_id)
  end

  def save_catelog_items
    object_type = params[:products] ? "products" : "posts" if params[:products] or params[:posts]
    object_ids = params[object_type].map(&:to_i)

    previous_object_ids =  @catelog.catelog_items.where(collection_type: object_type).map(&:collection_id)
    have_to_delete_object_ids = previous_object_ids - object_ids
    have_to_add_object_ids = object_ids - previous_object_ids
    if CatelogItem.save_catelog_item(object_type, @catelog.id, have_to_delete_object_ids, have_to_add_object_ids)
      render json: {status: 1}
    else
      render json: {status: 0}
    end
  end

  private
  def catelog_params
    params.require(:catelog).permit(:name, :status, :description, pictures_attributes: [:avatar]) 
  end

  def set_catelog
    @catelog = Catelog.find(params[:id]) if params[:id].present?
  end
end