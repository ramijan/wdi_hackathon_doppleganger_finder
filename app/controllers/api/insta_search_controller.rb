class Api::InstaSearchController < ApplicationController

	def index
		@resp = HTTParty.get("https://api.instagram.com/v1/media/search?lat=34.101644&lng=-118.339072&access_token=181260850.8c197b9.5509492be20640e9841b3a2a35850afe")
		@url_list = []
		@list = @resp['data'].each do |grams|
			@url_list << grams['images']['standard_resolution']['url']
		end
		render json: @url_list
	end

end