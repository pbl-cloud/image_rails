# == Schema Information
#
# Table name: created_pictures
#
#  id              :integer          not null, primary key
#  uploaded_url    :string(255)
#  created_url     :string(255)
#  base_picture_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class CreatedPicture < ActiveRecord::Base
end
