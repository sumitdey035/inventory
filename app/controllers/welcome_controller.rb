class WelcomeController < ApplicationController
  layout "application_frontend"
  skip_before_action :authenticate_user!

  def index
    @stories  = Post.published.desc
    @featured_story = @stories.featured
    @catelogs = Catelog.desc
    @image_slider = ImageSlider.live
  end
end