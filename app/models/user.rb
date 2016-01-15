class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader

  has_many :listings
  has_many :authentications, :dependent => :destroy
  
  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.encrypted_password = "encrypted_password"
      u.remote_avatar_url = auth_hash["info"]["image"].gsub('http://','https://')
      u.uid = auth_hash["uid"]
      u.authentications<<(authentication)
    end
  end

  
  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
  
  
  def password_optional?
    true
  end

  

end

