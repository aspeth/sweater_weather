class MapquestService
  def self.get_lat_long(location)
    conn = Faraday.new("http://www.mapquestapi.com/geocoding/v1/")
    response = conn.get("address?key=#{ENV["mapquest_api_key"]}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.get_directions(origin, destination)
    conn = Faraday.new("http://www.mapquestapi.com/directions/v2/")
    response = conn.get("route?key=#{ENV["mapquest_api_key"]}&from=#{origin}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end
end