class RenameCreatedPictureToImageTask < ActiveRecord::Migration
  def change
    remove_column :created_pictures, :created_image
    rename_table :created_pictures, :process_image_tasks
  end
end
