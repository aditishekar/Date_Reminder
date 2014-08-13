class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.binary :opt_in

      t.timestamps
    end
  end
end
