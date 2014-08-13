class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.date :date
      t.text :message
      t.binary :frequency_day
      t.binary :frequency_week
      t.binary :frequency_twoweek
      t.binary :frequency_month
      t.binary :method_text
      t.binary :method_email
      t.belongs_to :email

      t.timestamps
    end
  end
end
