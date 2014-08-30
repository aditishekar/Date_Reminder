class RemindersController < ApplicationController

  def index
	  @email = Email.new
#	  @reminder = Reminder.new
	  @email.reminders.build
  end

  def create
	@email = Email.find_or_create_by(email_params)
	@email.reminders << Reminder.new(reminder_params)
	session[:user_id] = params[:emails]

	##Try to figure how to send SMS via Twilio if someone clicks that option
	#text_to do |format|
	#  if @sms.save
	#  
	#  else
	#  end
	#end 

    respond_to do |format|
      if @email.save
        ReminderMailer.welcome_email(@email).deliver
          format.html { redirect_to root_path, notice: "** Thanks, we've got that reminder saved! We'll be in touch shortly. **" }
          format.json { render json: @email, status: :created, location: @email }
      else
          format.html { render action: 'new', notice: "** Try again, your reminder DID NOT save. Our crystal ball tells us that you're missing some crutial information. **" }
          format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def email_params
	params.require(:email).permit(:email, :opt_in, :sms)
  end

  def reminder_params
	params.require(:email).require(:reminders_attributes).require("0").permit!
  end

## End of Class
end

