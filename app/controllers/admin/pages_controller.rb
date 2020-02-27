class Admin::PagesController < ApplicationController
  before_action :set_page

  def index
    @pages = Page.get_all.page(params[:page])
  end

  def new
    @page = Page.new
  end

  def create
    @page = current_user.pages.new(page_params)
    
    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_pages_path, notice: "The page has been created successfully" }
      else
        format.html { render action: "new"}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @page.update_attributes(page_params)
        format.html { redirect_to admin_pages_path, notice: "The page has been updated successfully" }
      else
        format.html { render action: "edit"}
      end
    end
  end

  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to admin_pages_path, notice: "The page has been deleted successfully" }
    end
  end

  private
  def page_params
    params.require(:page).permit(:title, :description) 
  end

  def set_page
    @page = Page.find(params[:id]) if params[:id].present?
  end
end