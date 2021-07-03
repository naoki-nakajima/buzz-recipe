class CreateShopCommitments < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_commitments do |t|
      t.text :text, null: false
      t.references :shop_admin, foreign_key: true, null: false
      t.timestamps
    end
  end
end
