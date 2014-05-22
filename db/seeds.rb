# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


urls = [
  'http://res.cloudinary.com/dtdu3sqtl/image/upload/c_scale,w_460/v1400784189/mada_dafouk.png',
  'http://res.cloudinary.com/dtdu3sqtl/image/upload/c_scale,w_474/v1400784188/kansha_ej1v09.png',
  'http://res.cloudinary.com/dtdu3sqtl/image/upload/v1400784188/keikaku_hhdzxr.png'
]

urls.each do |url|
  BasePicture.find_or_create_by!(url: url)
end
