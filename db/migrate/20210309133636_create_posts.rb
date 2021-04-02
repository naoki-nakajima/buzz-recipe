class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :caption
      t.string :how_to_cock
      t.string :post_comment
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
