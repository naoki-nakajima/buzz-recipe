class RmoveShopCommitmentFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_reference :photos, :shop_commitment, null: false, foreign_key: true
  end
end
