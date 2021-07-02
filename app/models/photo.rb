class Photo < ApplicationRecord
  belongs_to :post
  belongs_to :shop_commitments
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
