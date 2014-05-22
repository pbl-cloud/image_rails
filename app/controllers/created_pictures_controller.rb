class CreatedPicturesController < ApplicationController
  def index
  end

  def new
    @created_picture = CreatedPicture.new
    @base_pictures = BasePicture.all
  end

  def create
  end

  def destroy
  end

end
