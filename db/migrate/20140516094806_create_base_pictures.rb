class CreateBasePictures < ActiveRecord::Migration
  def change
    create_table :base_pictures do |t|
      t.string :url

      t.timestamps
    end
  end
end
