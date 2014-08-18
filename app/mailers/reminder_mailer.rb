class ReminderMailer < ActionMailer::Base
  default from: "info@datereminder.com"
  layout 'bestest' # use bestest.(html|text).erb as layout

  def welcome_email(email)
  	@email = email
  	@url = 'http://datereminder.com/reminder'
  	mail(to: @email, subject: 'Thanks for signing up for Date Reminders!')
  end

end
