after_commit :geolocate_address

private
def geolocate_address
  url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address.gsub(/\s/, '+')}&sensor=true"
  response = JSON.parse(open(url).read)
  self.update_attributes(:lat => response["results"][0]["geometry"]["location"]["lat"], :long => response["results"][0]["geometry"]["location"]["lng"])
end