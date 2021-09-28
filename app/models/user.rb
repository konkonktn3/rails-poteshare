class User < ApplicationRecord
  has_secure_password
  mount_uploader :image, UserImageUploader
  
end