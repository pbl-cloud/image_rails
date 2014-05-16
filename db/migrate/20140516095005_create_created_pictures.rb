class CreateCreatedPictures < ActiveRecord::Migration
  def change
    create_table :created_pictures do |t|
      t.string :uploaded_url
      t.string :created_url
      t.integer :base_picture_id

      t.timestamps
    end
    add_index :created_pictures, :base_picture_id
  end
end
