class CreateBusinessDates < ActiveRecord::Migration[6.0]
  def change
    create_table :business_dates do |t|
      t.string :monday
      t.string :tuesday
      t.string :wedensday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.time :monday_opening_time
      t.time :monday_closing_time
      t.time :tuesday_opening_time
      t.time :tuesday_closing_time
      t.time :wedensday_opening_time
      t.time :wedensday_closing_time
      t.time :thursday_opening_time
      t.time :thursday_closing_time
      t.time :friday_opening_time
      t.time :friday_closing_time
      t.time :saturday_opening_time
      t.time :saturday_closing_time
      t.time :sunday_opening_time
      t.time :sunday_closing_time
      t.references :shop_admin, foreign_key: true, null: false
      t.timestamps
    end
  end
end
