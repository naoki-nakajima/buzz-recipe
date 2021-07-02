class ShopCommitment < ApplicationRecord
  belongs_to :shop_admin
  has_one :photo, dependent: :destroy

  accepts_nested_attributes_for :photo
end
