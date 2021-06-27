class CreateBusinessDates < ActiveRecord::Migration[6.0]
  def change
    create_table :business_dates do |t|
      t.string :sunday
      t.string :monday
      t.string :tuesday
      t.string :wedensday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.references :shop_admin, foreign_key: true, null: false
      t.timestamps
    end
  end
end
