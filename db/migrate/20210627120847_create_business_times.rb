class CreateBusinessTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :business_times do |t|
      t.time :opening_time
      t.time :closing_time
      t.references :business_date, foreign_key: true, null: false
      t.timestamps
    end
  end
end
