require 'rails_helper'

RSpec.describe HourlyWeather do
  xit 'exists and has attributes', :vcr do
    lat_long = MapquestFacade.get_lat_long("denver,co")
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])

    weather_poro = Weather.new(weather)

    hourly_weather = weather_poro.hourly_weather.first

    expect(hourly_weather).to be_an_instance_of(HourlyWeather)
    expect(hourly_weather.time).to be_a(String)
    expect(hourly_weather.temperature).to be_a(Float)
    expect(hourly_weather.conditions).to be_a(String)
    expect(hourly_weather.icon).to be_a(String)
  end
end