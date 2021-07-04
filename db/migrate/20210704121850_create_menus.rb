class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :price
      t.string :caption
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
