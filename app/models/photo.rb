class Photo < ApplicationRecord
  belongs_to :post
  validates :image, presence: true
  belongs_to :shop_commitment
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
