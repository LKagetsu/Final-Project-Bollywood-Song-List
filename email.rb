require 'mailgun'

class Email
	Mailgun.configure do |config|
	  config.api_key = 'key-7oyo8ubqwl5vsangtntrlsadgq8cpd37'
	  config.domain  = 'sandbox0643d7a456af493ab765c4812d96d929.mailgun.org'
	end


	def send(email_address)
		@mailgun = Mailgun(:api_key => 'your-api-key')

		parameters = {
		 	:to => "monkeybizz14@gmail.com",
			:subject => "Recent Popular Bollywood Songs",
			:text => "I'm sending this through a web app i made. text me if this works :D, <3 Lauren",
			:from => "postmaster@sandbox0643d7a456af493ab765c4812d96d929.mailgun.org"
		}
		parameters[:to] = (email_address)
		@mailgun.messages.send_email(parameters)
	end

end

Hello = Email.new
Hello.send("lkagetsu@gmail.com")