class User < ApplicationRecord
  
  mount_uploader :image, UserImageUploader
  validates :name, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX , message: 'は@を付けた形で入力してください' }
  has_secure_password
  validates :password, length: {minimum: 6, message: 'は必ず6文字以上で入力してください'}
  

  has_many :posts
  has_many :reservations
end
