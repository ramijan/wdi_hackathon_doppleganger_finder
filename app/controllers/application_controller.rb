class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home

    if params[:photo] && params[:photo] != ''
      @me = params[:photo]
      image_url = params[:photo]
      @facedata = JSON.parse(FacePlusPlus.getFaceData(image_url).body)
      face_id1 = @facedata['face'][0]['face_id'] if @facedata['face'].length > 0
      

      @matches = []

      @best_match = 0
      @best_match_index = 0

      @images = Instamodel.search()
      @images[0..5].each do |url|
        facedata = JSON.parse(FacePlusPlus.getFaceData(url).body)
        face_id2 = facedata['face'][0]['face_id'] if facedata['face'].length > 0
        comparison = FacePlusPlus.compareFaces(face_id1, face_id2)
        @matches << comparison

        if comparison && comparison['similarity'] > @best_match
          @best_match = comparison['similarity']
          @best_match_index = @matches.length - 1
        end


      end

      render :home  

    end

  end

end
