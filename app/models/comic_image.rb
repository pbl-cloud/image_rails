# == Schema Information
#
# Table name: comic_images
#
#  id              :integer          not null, primary key
#  original_image  :string(255)
#  base_picture_id :integer
#  composite_image :string(255)
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ComicImage < ActiveRecord::Base
  belongs_to :user

  mount_uploader :composite_image, PersistentImageUploader
end
