class PostsController < ApplicationController
  layout "application_frontend"
  skip_before_action :authenticate_user!
  before_action :set_post

  def index
    @posts = Post.get_all
  end

  def show
    @price_request = PriceRequest.new
  end

  private
  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end
end