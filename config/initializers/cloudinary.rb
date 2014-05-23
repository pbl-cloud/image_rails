Cloudinary.config do |config|
  config.cloud_name = 'dtdu3sqtl'
  config.api_key = Settings.auth.cloudinary.api_key
  config.api_secret = Settings.auth.cloudinary.api_secret
  config.enhance_image_tag = true
  config.static_image_support = true
end
