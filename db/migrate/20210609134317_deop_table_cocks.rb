class DeopTableCocks < ActiveRecord::Migration[6.0]
  def change
    drop_table :cocks do |t|
      t.string :how_to
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
