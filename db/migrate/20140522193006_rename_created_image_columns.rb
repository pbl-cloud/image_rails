class RenameCreatedImageColumns < ActiveRecord::Migration
  def change
    rename_column :created_pictures, :uploaded_url, :uploaded_image
    rename_column :created_pictures, :created_url, :created_image
  end
end
