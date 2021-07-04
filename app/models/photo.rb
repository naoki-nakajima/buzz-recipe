class Photo < ApplicationRecord
  belongs_to :post
  belongs_to :menu
  mount_uploader :image, ImageUploader
end
