class PagesController < ApplicationController
  layout "application_frontend"
  skip_before_action :authenticate_user!
  before_action :set_page

  def show
  end

  private
  def set_page
    @page = Page.find(params[:id]) if params[:id].present?
  end
end