# == Schema Information
#
# Table name: base_pictures
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BasePicture < ActiveRecord::Base
end
