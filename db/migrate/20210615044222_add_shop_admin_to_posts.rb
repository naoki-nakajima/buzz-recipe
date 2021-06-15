class AddShopAdminToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :shop_admin, null: false, foreign_key: true
  end
end
