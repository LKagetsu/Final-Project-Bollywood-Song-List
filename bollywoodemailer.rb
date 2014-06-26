require 'pry'
require 'nokogiri'
require 'open-uri'



class ScrapeSongs
	
	def initialize
		@html = Nokogiri::HTML(open('http://www.bollywoodhungama.com/more/music/index/type/listing'))
	end

	def scrape_data
		#TODO: duplicating all songs-- need to sanitize
		projects = {}

		@html.css("div.play_music_cont").each do |project|
			
			title = project.css("li.mfl.mwidth425.bg_0000.moverflow.mml7 h3 span.m0081c8 a").text
			
			projects[title] = {
				:title => title,
				:film => project.css("li.mfl.mwidth425.bg_0000.moverflow.mml7 h3 span a.ma71528").text, 
				:music_link => "http://www.bollywoodhungama.com/more/music/index/type/listing#"
				# :music_link => project.css("li.mfl.malignlft.moverflow.minline.mht24.mmr15 a")["href"]
			}
		end
		projects
	end

#iterate throught the projects hash -- projects.each do |hash| ---> hash.each do |k, v| ---> {:title => etc.}


end





class Songs

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

	def music_link
		@music_link
	end

	def music_link=(music_link)
		@music_link
	end

	def self.all
		ObjectSpace.each_object(self).to_a
	end

	def self.new_songs
		instance_of_scraper_class = ScrapeSongs.new
		instance_of_scraper_class.scrape_data.each do |big_hash_key, big_hash_value|
			new_song = big_hash_key.to_s
			new_song = Songs.new
			new_song.title = big_hash_value[:title]
			new_song.film = big_hash_value[:film]
			new_song.music_link = big_hash_value[:music_link]
		end
	end


	#a method that will give us the projects array/hash?


	#create a new instance of your ScrapeSong class
	#class Songs on that instance

end





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