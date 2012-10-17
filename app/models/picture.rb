class Picture < ActiveRecord::Base
  attr_accessible :picture, :product_id, :remote_picture_url, :picture_cache
  belongs_to :product
  validates :product_id, :presence => true
  mount_uploader :picture, PictureUploader
end
