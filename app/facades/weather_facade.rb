class WeatherFacade
  def self.get_weather(lat, long)
    WeatherService.get_weather(lat, long)
  end
end