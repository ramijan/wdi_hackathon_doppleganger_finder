require 'httparty'

class FacePlusPlus

  def self.getFaceData(image_url)
    return HTTParty.get("https://apius.faceplusplus.com/v2/detection/detect?url=#{image_url}&api_secret=#{ENV['FACE_SECRET']}&api_key=#{ENV['FACE_KEY']}&attribute=glass,pose,gender,age,race,smiling")
  end

  def self.compareFaces(face_id1, face_id2)
    return HTTParty.get("https://apius.faceplusplus.com/v2/recognition/compare?api_secret=#{ENV['FACE_SECRET']}&api_key=#{ENV['FACE_KEY']}&face_id2=#{face_id2}&face_id1=#{face_id1}")
  end

end