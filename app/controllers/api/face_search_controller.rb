class Api::FaceSearchController < ApplicationController

  def index
    image_url = "http://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/durchschnittsgesichter/m(01-32)_gr.jpg"
    @facedata = FacePlusPlus.getFaceData(image_url)
    face_id1 = JSON.parse(@facedata.body)['face'][0]['face_id']
    
    image_url2 = "http://www.naircare.co.uk/images/main/hub/bg-face.jpg"
    @facedata2 = FacePlusPlus.getFaceData(image_url2)
    face_id2 = JSON.parse(@facedata2.body)['face'][0]['face_id']
    
    comparison = FacePlusPlus.compareFaces(face_id1, face_id2)

    render json: comparison
  end


end