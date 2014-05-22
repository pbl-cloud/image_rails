class AddUserIdToCreatedPicture < ActiveRecord::Migration
  def change
    add_column :created_pictures, :user_id, :integer
    add_index :created_pictures, :user_id
  end
end
