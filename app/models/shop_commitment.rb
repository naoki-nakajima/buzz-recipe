class ShopCommitment < ApplicationRecord
  belongs_to :shop_admin
  has_one :commitment_photo

  accepts_nested_attributes_for :commitment_photo, allow_destroy: true
end
