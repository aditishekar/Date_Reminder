class ReminderMailer < ActionMailer::Base
  default from: "datenightpost@gmail.com"
  layout 'bestest' # use bestest.(html|text).erb as layout

  def welcome_email(email)
  	@email = email
  	@url = 'http://datenightpost.com/reminder'
  	mail(to: @email, subject: 'Thanks for signing up for Date Reminders!')
  end

end
