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
    Dir.mktmpdir do |dir|
      path = File.join(dir, "comic-%d.jpg")
      base_file = download_file(dir)
      images = make_comic(base_file, self.mode, output: path)
      images.count.times do |i|
        comic_image = ComicImage.new(
          user_id: self.user_id,
          base_picture_id: self.base_picture_id,
          original_image: self.uploaded_image.url
        )
        comic_image.composite_image = File.open(path % i)
        comic_image.save!
      end
    end
    self.destroy!
  end
  handle_asynchronously :process_image

  private
  def download_file(dir)
    image_url = self.uploaded_image.url
    file_path = File.join(dir, File.basename(image_url))
    response = HTTParty.get(image_url)
    File.open(file_path, 'wb') do |file|
      file.write(response.body)
    end
    file_path
  end
end
