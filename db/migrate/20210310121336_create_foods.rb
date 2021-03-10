class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :ingredient
      t.string :quantity
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
