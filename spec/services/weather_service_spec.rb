require 'rails_helper'

RSpec.describe 'WeatherService' do
  it 'returns forecast information' do
    lat_long = MapquestService.get_lat_long("denver,co")
    response = WeatherService.get_weather(lat_long[:lat], lat_long[:lng])

    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)
    expect(response).to have_key(:daily)
    expect(response).to have_key(:hourly)
  end
end