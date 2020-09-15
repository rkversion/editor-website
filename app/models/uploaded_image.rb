class UploadedImage < ActiveRecord::Base
  def self.get_uploaded_images
    uri = URI.parse('http://noter-backend:3001/api/v0.1/images/')
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
