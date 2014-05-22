class AddModeToBasePicture < ActiveRecord::Migration
  def change
    add_column :base_pictures, :mode, :string
  end
end
