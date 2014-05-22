class User < ActiveRecord::Base
  devise :rememberable, :trackable
  devise :omniauthable, omniauth_providers: [:twitter]


  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
    end
  end
end
