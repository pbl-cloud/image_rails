class ComicImagesController < ApplicationController
  before_filter :find_comic_image

  before_action :authenticate_user!, only: [:my]

  def index
    @comic_images = ComicImage.all
  end

  def my
    @comic_images = current_user.comic_images
    render :index
  end

  private
  def find_comic_image
    @comic_image = ComicImage.find(params[:id]) if params[:id]
  end
end
