class MapquestService < BaseService
  def self.get_lat_long(location)
    response = conn("http://www.mapquestapi.com/geocoding/v1/").get("address?key=#{ENV["mapquest_api_key"]}&location=#{location}")
    get_json(response)[:results][0][:locations][0][:latLng]
  end

  def self.get_directions(origin, destination)
    response = conn("http://www.mapquestapi.com/directions/v2/").get("route?key=#{ENV["mapquest_api_key"]}&from=#{origin}&to=#{destination}")
    get_json(response)
  end
end