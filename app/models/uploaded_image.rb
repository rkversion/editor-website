class UploadedImage < ActiveRecord::Base
  def self.get_uploaded_images(user)
    uri = URI.parse(Settings.noter_backend_internal + Settings.noter_backend_whatdoihave_path)
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req["X-Email"] = user.email
    res = http.request(req)
    user_has = JSON.parse(res.body)
    return user_has['images_by_user']
  end
end
