class WeatherService < BaseService
  def self.get_weather(lat, long)
    response = conn("https://api.openweathermap.org/data/2.5/").get("onecall?lat=#{lat}&lon=#{long}&appid=#{ENV["openweather_api_key"]}&units=imperial")
    get_json(response)
  end
end