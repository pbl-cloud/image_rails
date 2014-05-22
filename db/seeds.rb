
base_pictures = [
  {
    url: 'http://res.cloudinary.com/dtdu3sqtl/image/upload/c_scale,w_460/v1400784189/mada_dafouk.png',
    mode: 'mada'
  },
  {
    url: 'http://res.cloudinary.com/dtdu3sqtl/image/upload/c_scale,w_474/v1400784188/kansha_ej1v09.png',
    mode: 'kansha'
  },
  {
    url: 'http://res.cloudinary.com/dtdu3sqtl/image/upload/v1400784188/keikaku_hhdzxr.png',
    mode: 'keikaku'
  }
]

base_pictures.each do |picture|
  BasePicture.find_or_create_by!(mode: picture[:mode]) do |p|
    p.url = picture[:url]
  end
end
