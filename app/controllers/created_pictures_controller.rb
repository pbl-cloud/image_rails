class CreatedPicturesController < ApplicationController
  def index
  end

  def new
    @created_picture = CreatedPicture.new
    @base_pictures = BasePicture.all
  end

  def create
    @created_picture = current_user.created_pictures.build(picture_params)
    if @created_picture.save
      # TODO: process image in background
      redirect_to root_path, notice: 'サブミットされた'
    else
      render :new
    end
  end

  def destroy
  end

  private
  def picture_params
    params.require(:created_picture).permit(:uploaded_image, :base_picture_id)
  end

end
