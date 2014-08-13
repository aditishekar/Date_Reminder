class AddSms < ActiveRecord::Migration
  def change

  	add_column :reminders, :date_type, :string
  	add_column :emails, :sms, :string

  end
end
