require 'pry'
require 'nokogiri'
require 'open-uri'



bollywood = Nokogiri::HTML(html)
projects[:music_link] = "http://www.bollywoodhungama.com/more/music/index/type/listing#"



class ScrapeSongs
	
	def initialize(html)
		html = open('http://www.bollywoodhungama.com/more/music/index/type/listing')
		@html = Nokogiri::HTML(html)
	end

	def scrape_data
		projects = {}

		projects[:music_link] = "http://www.bollywoodhungama.com/more/music/index/type/listing#"

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
	end


#iteraate throught the projects hash -- projects.each do |hash| ---> hash.each do |k, v| ---> {:title => etc.}


end


class Songs

	#title reader and writer
	#film reader and writer

	def title
		@title
	end

	def title=(title)
		@title = title
	end

	def film
		@film
	end

	def film=(film)
		@film = film
	end

	def self.all
		ObjectSpace.each_object(self).to_a
	end

	def self.new_songs
		instance_of_scraper_class = ScrapeSongs.new
		instance_of_scraper_class.scrape_data.each do |k, v|
			puts k = Songs.new
			puts k.title = v[:title]
			puts k.film = v[:film]
	#a method that will give us the projects array/hash?


	#create a new instance of your ScrapeSong class
	#class Songs on that instance
end





song = ScrapeSongs.new

song.title

song.film

# class Email

# 	Mailgun.configure do |config|
# 	  config.api_key = 'key-7oyo8ubqwl5vsangtntrlsadgq8cpd37'
# 	  config.domain  = 'sandbox0643d7a456af493ab765c4812d96d929.mailgun.org'
# 	end

# 	def send(email_address)
# 		@mailgun = Mailgun(:api_key => 'your-api-key')

# 		parameters = {
# 		 	:to => "monkeybizz14@gmail.com",
# 			:subject => "bollywood",
# 			:text => text,
# 			:from => "postmaster@sandbox0643d7a456af493ab765c4812d96d929.mailgun.org"
# 		}

# 		task :text << END_OF_MESSAGE
# 			puts
# 				<h1> <link href=:music_link "#{:title}"</h1>
# 				<h2> :from </h2>
# 				<h1> :film </h1>

# 		END_OF_MESSAGE
		

#moving to github
#song link (java)
#email text?
#youtube?














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