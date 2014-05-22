class ProcessImageTasksController < ApplicationController
  def index
  end

  def new
    @created_picture = ProcessImageTask.new
    @base_pictures = BasePicture.all
  end

  def create
    @created_picture = current_user.tasks.build(task_params)
    if @created_picture.save
      @created_picture.process_image
      redirect_to root_path, notice: 'タスクがサブミットされた'
    else
      render :new
    end
  end

  def destroy
  end

  private
  def task_params
    params.require(:process_image_task).permit(:uploaded_image, :base_picture_id)
  end

end
