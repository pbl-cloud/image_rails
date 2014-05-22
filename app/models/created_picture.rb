# == Schema Information
#
# Table name: created_pictures
#
#  id              :integer          not null, primary key
#  uploaded_image  :string(255)
#  created_image   :string(255)
#  base_picture_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

class CreatedPicture < ActiveRecord::Base
  belongs_to :user

  mount_uploader :uploaded_image, MixinPictureUploader
end
