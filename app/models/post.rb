class Post < ApplicationRecord
  mount_uploader :image, RoomPicsUploader
  
  validates :roomname, presence:true
  validates :introduction, length: { in: 10..100 }
  validates :price, numericality: true
  validates :address, presence:true
  validates :image, presence: { message: 'をアップロードしてください' }

  belongs_to :user
  has_many :reservations
end
