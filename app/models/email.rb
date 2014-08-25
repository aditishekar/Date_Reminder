class Email < ActiveRecord::Base
	has_many :reminders
	accepts_nested_attributes_for :reminders

	validates :email, uniqueness: true

end





