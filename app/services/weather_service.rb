class WeatherService
  def self.get_weather(lat, long)
    conn = Faraday.new("https://api.openweathermap.org/data/2.5/")
    response = conn.get("onecall?lat=#{lat}&lon=#{long}&appid=#{ENV["openweather_api_key"]}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
end