class ShopCommitment < ApplicationRecord
  belongs_to :shop_admin
  has_many :photos

  accepts_nested_attributes_for :photos
end
