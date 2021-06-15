class RemovePostCommentFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :post_comment, :string
  end
end
