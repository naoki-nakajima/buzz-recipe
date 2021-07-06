class CreateCommitmentPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :commitment_photos do |t|
      t.string :image, null: false
      t.references :shop_commitment, foreign_key: true, null: false
      t.timestamps
    end
  end
end
