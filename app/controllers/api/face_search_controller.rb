class Api::FaceSearchController < ApplicationController

  def index
    image_url = "http://faceplusplus.com/static/img/demo/1.jpg"
    @facedata = HTTParty.get("https://apius.faceplusplus.com/v2/detection/detect?url=#{image_url}&api_secret=#{ENV['FACE_SECRET']}&api_key=#{ENV['FACE_KEY']}&attribute=glass,pose,gender,age,race,smiling")
    render json: @facedata
  end


end