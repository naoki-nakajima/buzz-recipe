class AddPriceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :price, :string
  end
end
