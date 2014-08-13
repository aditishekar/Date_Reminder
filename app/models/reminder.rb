class Reminder < ActiveRecord::Base
	belongs_to :email

	validates :message, length: { minimum: 2 }
	validates :date, presence: true
end
