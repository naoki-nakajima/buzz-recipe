class AddShopCommitmentToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :shop_commitment, null: false, foreign_key: true
  end
end
