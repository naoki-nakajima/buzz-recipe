class CommitmentPhoto < ApplicationRecord
  belongs_to :shop_commitment
  mount_uploader :image, ImageUploader
end
