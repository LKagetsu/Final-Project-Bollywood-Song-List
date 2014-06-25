require 'pry'
require 'nokogiri'
require 'open-uri'

require 'mailgun'



html = open('http://www.bollywoodhungama.com/more/music/index/type/listing')

bollywood = Nokogiri::HTML(html)

projects = {}

projects[:music_link] = "http://www.bollywoodhungama.com/more/music/index/type/listing#"




class Email
	
	Mailgun.configure do |config|
	  config.api_key = 'key-7oyo8ubqwl5vsangtntrlsadgq8cpd37'
	  config.domain  = 'sandbox0643d7a456af493ab765c4812d96d929.mailgun.org'
	end

	def send(email_address)
		@mailgun = Mailgun(:api_key => 'your-api-key')

		parameters = {
		 	:to => "monkeybizz14@gmail.com",
			:subject => "bollywood",
			:text => text,
			:from => "postmaster@sandbox0643d7a456af493ab765c4812d96d929.mailgun.org"
		}

		task :text
			puts
				<h1> <link href=:music_link "#{:title}"</h1>
				<h2> :from </h2>
				<h1> :film </h1>
		





		end

		text = {
			bollywood.css("div.play_music_cont").each do |project|
			
				title = project.css("li.mfl.mwidth425.bg_0000.moverflow.mml7 h3 span.m0081c8 a").text.to_sym
				
				projects[title] = {
					# :song_id => project.css("li.mfl.mht22.moverflow.minline input.chk_1828482"),
					:title => title,
					:from => project.css("li.mfl.mwidth425.bg_0000 h3 span.mb_000.mfnt11").text,
					:film => project.css("li.mfl.mwidth425.bg_0000.moverflow.mml7 h3 span a.ma71528").text
					# :music_link => project.css("li.mfl.malignlft.moverflow.minline.mht24.mmr15 a")["href"]	
				}
			end
		}

	




		parameters[:to] = (email_address)
		@mailgun.messages.send_email(parameters)
	end








end










# :image_link => project.css("div.category_flag.entertainment").text,
		# :image => project.css("div.image_wrapper img").attribute("src").value,
# 		:location => project.css("ul.project-meta").text,
# 		:percent_funded => project.css("ul.project-stats li.first.funded strong").text

# # projects: kickstarter.css("li.project.grid_4")
# # title: project.css("h2.bbcard_name strong a").text
# # image link: project.css("div.project-thumbnail a img").attribute("src").value
# # description: project.css("p.bbcard_blurb").text
# # location: project.css("ul.project-meta").text
# # percent_funded: project.css("ul.project-stats li.first.funded strong").text





# # This just opens a file and reads it into a variable
# html = File.read('fixtures/kickstarter.html')

# kickstarter = Nokogiri::HTML(html)

# projects = {}

# # Iterate through the projects
# kickstarter.css("li.project.grid_4").each do |project|
# 	title = project.css("h2.bbcard_name strong a").text.to_sym
# 	projects[project] = {
# 		:image_link => project.css("div.project-thumbnail a img").attribute("src").value,
# 		:description => project.css("p.bbcard_blurb").text,
# 		:location => project.css("ul.project-meta").text,
# 		:percent_funded => project.css("ul.project-stats li.first.funded strong").text
# 	}
# end






















binding.pry