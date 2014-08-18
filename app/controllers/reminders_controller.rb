class RemindersController < ApplicationController

## List both models in the controller

	def index
		@email = Email.new
		@email.reminders.build
    end

    def create
		##add a validation to see if the email exists other create a new one
		#email.find
		email = Email.new(email_params)
		email.save

		reminder = Reminder.new(reminder_params)
		reminder.save
		## Added new reminder to the list of nested reminders
		reminder.email = @email

		if reminder.save
		   flash[:notice] = "**We've got that reminder saved!**"
		   session[:user_id] = params[:emails]
		   redirect_to root_path
		else
		   flash[:error] = "**Try again, you're missing some crutial information.**"
		   redirect_to root_path
	    end

	    respond_to do |format|
           if @email.save
        # Tell the ReminderMailer to send a welcome email after save
              ReminderMailer.welcome_email(@email).deliver
 
        	  format.html { redirect_to(@email, notice: 'User was successfully created.') }
        	  format.json { render json: @email, status: :created, location: @email }

		# Try to figure how to WTFing send SMS via Twilio if someone clicks that option
		#text_to do |format|
		#	if @phone_number.save 

        #  end

	end

# Add validations to your error message & display those things in your flash message

	private

  	def email_params
    	params.require(:email).permit(:email, :opt_in, :sms)
	end
  	def reminder_params
    	params.require(:email).require(:reminders_attributes).require("0").permit!
	end

## End of Class
end
