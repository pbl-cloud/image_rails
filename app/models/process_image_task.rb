# == Schema Information
#
# Table name: process_image_tasks
#
#  id              :integer          not null, primary key
#  uploaded_image  :string(255)
#  base_picture_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

class ProcessImageTask < ActiveRecord::Base
  include Hamecomic

  belongs_to :user
  belongs_to :base_picture

  mount_uploader :uploaded_image, MixinPictureUploader

  delegate :mode, to: :base_picture

  def process_image
    images = make_comic(self.uploaded_image.path, self.mode)
    # FIXME: all images are the same
    # TODO: upload processed images and save URL to DB
    images.each_with_index do |img, i|
      img.save("img-#{i}.jpg")
    end
  end
  handle_asynchronously :process_image
end
