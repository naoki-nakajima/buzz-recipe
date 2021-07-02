class ShopCommitment < ApplicationRecord
  belongs_to :shop_admin
  has_msny :photos
end
