class Admin::PicturesController < ApplicationController
  before_action :set_picture

  def destroy
    @picture.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id]) if params[:id].present?
  end
end