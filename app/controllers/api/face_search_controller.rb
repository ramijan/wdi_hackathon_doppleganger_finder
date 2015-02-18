class Api::FaceSearchController < ApplicationController

  def index
    image_url = "http://faceplusplus.com/static/img/demo/1.jpg"
    @facedata = HTTParty.get("https://apius.faceplusplus.com/v2/detection/detect?url=#{image_url}&api_secret=#{ENV['nipMH0pxm5XCz3mi7XYuw1f4mBFjv8vT']}&api_key=#{ENV['ca2075ce565bca77531270ff40dcf5a8']}&attribute=glass,pose,gender,age,race,smiling")
    render json: @facedata
  end


end