class Admin::PostsController < ApplicationController
  before_action :set_post

  def index
    @posts = Post.get_all.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_admin_post_path(@post), notice: "The post has been created successfully" }
      else
        format.html { render action: "new"}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to admin_posts_path, notice: "The post has been updated successfully" }
      else
        format.html { render action: "edit"}
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_path, notice: "The post has been deleted successfully" }
    end
  end

  def upload
    @post.save_pictures(params[:file])

    render json: { id: 1 }
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :featured, :status, :category_id, :user_id) 
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end
end