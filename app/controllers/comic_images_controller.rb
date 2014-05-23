class ComicImagesController < ApplicationController
  before_filter :find_comic_image

  def index
    if user_signed_in? && params[:q] != 'all'
      @comic_images = current_user.comic_images
    else
      @comic_images = ComicImage.all
    end
  end

  private
  def find_comic_image
    @comic_image = ComicImage.find(params[:id]) if params[:id]
  end
end
