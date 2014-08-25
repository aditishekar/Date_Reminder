class RemindersController < ApplicationController

	def index
		@email = Email.new
		@email.reminders.build
    end

    def create
		##add a validation to see if the email exists other create a new one
		#email.find
		email = Email.new(email_params)
		email.reminders << Reminder.new(reminder_params)
		session[:user_id] = params[:emails]

		##Try to figure how to WTFing send SMS via Twilio if someone clicks that option
		#   text_to do |format|
		#	if @phone_number.save 

		respond_to do |format|
        	if email.save
        	ReminderMailer.welcome_email(@email).deliver
	        	format.html { redirect_to root_path, notice: "** Thanks, we've got that reminder saved! We'll be in touch shortly. **" }
          		format.json { render json: @email, status: :created, location: @email }
			else
		    	format.html { render action: 'new', notice: "** Try again, your reminder DID NOT save. Our crystal ball tells us that you're missing some crutial information. **" }
	      		format.json { render json: @email.errors, status: :unprocessable_entity }
	      	end
	    end
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
