class CreateComicImages < ActiveRecord::Migration
  def change
    create_table :comic_images do |t|
      t.string :original_image
      t.integer :base_picture_id
      t.string :composite_image
      t.belongs_to :user

      t.timestamps
    end
    add_index :comic_images, :user_id
    add_index :comic_images, :base_picture_id
  end
end
