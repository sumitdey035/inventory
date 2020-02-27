class CatelogsController < ApplicationController
  layout "application_frontend"
  skip_before_action :authenticate_user!
  
  before_action :set_catelog

  def index
    @catelogs = Catelog.desc
  end

  def show
    @catelogs = Catelog.desc
  end

  private
  def catelog_params
    params.require(:catelog).permit(:name, :status, :description, pictures_attributes: [:avatar]) 
  end

  def set_catelog
    @catelog = Catelog.find(params[:id]) if params[:id].present?
  end
end