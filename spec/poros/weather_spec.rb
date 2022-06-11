require 'rails_helper'

RSpec.describe Weather do
  it 'exists and has attributes', :vcr do
    lat_long = MapquestFacade.get_lat_long("denver,co")
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])

    weather_poro = Weather.new(weather)

    expect(weather_poro).to be_an_instance_of(Weather)
    expect(weather_poro.id).to be nil
    expect(weather_poro.datetime).to be_a(Time)
    expect(weather_poro.sunrise).to be_a(Time)
    expect(weather_poro.sunset).to be_a(Time)
    expect(weather_poro.temperature).to be_a(Float)
    expect(weather_poro.feels_like).to be_a(Float)
    expect(weather_poro.humidity).to be_an(Integer)
    expect(weather_poro.uvi).to be_a(Float)
    expect(weather_poro.visibility).to be_an(Integer)
    expect(weather_poro.conditions).to be_a(String)
    expect(weather_poro.icon).to be_a(String)
    expect(weather_poro.daily_weather).to be_an(Array)
    weather_poro.daily_weather.each do |day|
      expect(day).to be_an_instance_of(DailyWeather)
    end
    expect(weather_poro.hourly_weather).to be_an(Array)
    weather_poro.hourly_weather.each do |hour|
      expect(hour).to be_an_instance_of(HourlyWeather)
    end
  end
end