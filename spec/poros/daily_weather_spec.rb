require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes', :vcr do
    lat_long = MapquestFacade.get_lat_long("denver,co")
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])

    weather_poro = Weather.new(weather, 8)

    daily_weather = weather_poro.daily_weather.first

    expect(daily_weather).to be_an_instance_of(DailyWeather)
    expect(daily_weather.date).to be_a(String)
    expect(daily_weather.sunrise).to be_a(Time)
    expect(daily_weather.sunset).to be_a(Time)
    expect(daily_weather.max_temp).to be_a(Float)
    expect(daily_weather.min_temp).to be_a(Float)
    expect(daily_weather.conditions).to be_a(String)
    expect(daily_weather.icon).to be_a(String)
  end
end