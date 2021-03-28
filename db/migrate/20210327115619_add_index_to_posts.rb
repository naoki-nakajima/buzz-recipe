class AddIndexToPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :caption, length: 32
  end
end
