require 'rails_helper'

RSpec.describe 'mapquest facade' do
  it 'returns latitude and longitude' do
    lat_long = MapquestFacade.get_lat_long("denver,co")

    expect(lat_long).to be_a(Hash)
    expect(lat_long).to have_key(:lat)
    expect(lat_long[:lat]).to be_a(Float)
    expect(lat_long).to have_key(:lng)
    expect(lat_long[:lng]).to be_a(Float)
  end
end