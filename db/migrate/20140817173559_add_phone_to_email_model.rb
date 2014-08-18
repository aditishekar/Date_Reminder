class AddPhoneToEmailModel < ActiveRecord::Migration
  def change

  	add_column :emails, :phone_number, :integer

  end
end
