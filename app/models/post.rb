class Post < ApplicationRecord
  mount_uploader :image, RoomPicsUploader
  
  validates :roomname, presence:true
  validates :introduction, presence:true
  validates :price, numericality: true
  validates :address, presence:true
  validates :image, presence:true


end
