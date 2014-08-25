class Email < ActiveRecord::Base
	has_many :reminders
	accepts_nested_attributes_for :reminders

	validates_presence_of :email

end





