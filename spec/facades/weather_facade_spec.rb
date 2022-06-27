require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'returns forecast information for a location when given latitude and longitude' do
    lat_long = MapquestFacade.get_lat_long("denver,co")
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])

    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:current)
    expect(weather).to have_key(:daily)
    expect(weather).to have_key(:hourly)
  end
end