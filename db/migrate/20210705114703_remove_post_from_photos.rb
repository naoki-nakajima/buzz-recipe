class RemovePostFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_reference :photos, :post, null: false, foreign_key: true
  end
end
