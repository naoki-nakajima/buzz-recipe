class AddMenuToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :menu, null: false, foreign_key: true
  end
end
