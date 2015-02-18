class Instamodel

	def self.search
		@resp = HTTParty.get("https://api.instagram.com/v1/media/search?lat=34.101644&lng=-118.339072&access_token=#{ENV['INSTA_TOKEN']}")
		@url_list = []
		@list = @resp['data'].each do |grams|
			@url_list << grams['images']['standard_resolution']['url']
		end

		return @url_list
	
	end

end
