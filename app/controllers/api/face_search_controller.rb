class Api::FaceSearchController < ApplicationController

  def index
    image_url = "http://cdn.stylisheve.com/wp-content/uploads/2012/01/Men-Hairstyles-for-round-face_06.jpg"
    @facedata = JSON.parse(FacePlusPlus.getFaceData(image_url).body)
    face_id1 = @facedata['face'][0]['face_id'] if @facedata['face'].length > 0
    

    @matches = []

    images = InstaModel.search()
    images.each do |url|
      facedata = JSON.parse(FacePlusPlus.getFaceData(url).body)
      face_id2 = facedata['face'][0]['face_id'] if facedata['face'].length > 0
      comparison = FacePlusPlus.compareFaces(face_id1, face_id2)
      @matches << comparison
    end

    # redirect_to results_path
    render json: @matches

  end


end