class CreateShopInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_infos do |t|
      t.string :store_name
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :caption
      t.references :shop_admin, foreign_key: true, null: false
    end
  end
end
