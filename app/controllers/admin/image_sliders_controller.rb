class Admin::ImageSlidersController < ApplicationController
  before_action :set_image_slider

  def index
    @image_sliders = ImageSlider.get_all
    @image_slider = ImageSlider.new
    @image_slider.pictures.build
  end

  def create
    @image_slider = ImageSlider.new(image_slider_params)

    respond_to do |format|
      if @image_slider.save
        params[:image_slider][:pictures_attributes]["0"][:avatar].each do |picture|      
          @image_slider.pictures.create(:avatar=> picture) if params[:image_slider][:pictures_attributes]["0"][:avatar].count > 0
        end
        format.html { redirect_to admin_image_sliders_path, notice: "The image slider has been created successfully" }
      else
        @image_sliders = ImageSlider.get_all
        @image_slider.pictures.build
        format.html { render action: "index"}
      end
    end
  end

  def edit
  end

  def update    
    respond_to do |format|
      if @image_slider.update_attributes(image_slider_params)
        format.html { redirect_to admin_image_sliders_path, notice: "The image slider has been created successfully" }
      else
        format.html { render action: "index"}
      end
    end
  end

  def destroy
    @image_slider.destroy

    respond_to do |format|
      format.html { redirect_to admin_image_sliders_path, notice: "The image slider has been deleted successfully" }
    end
  end

  private
  def image_slider_params
    params.require(:image_slider).permit(:name, :status) 
  end

  def set_image_slider
    @image_slider = ImageSlider.find(params[:id]) if params[:id].present?
  end
end