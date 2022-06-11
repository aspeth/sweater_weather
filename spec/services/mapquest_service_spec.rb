require 'rails_helper'

RSpec.describe 'Mapquest Service' do
  it 'gets latitude and longitude from a location' do
    response = MapquestService.get_lat_long("denver,co")

    expect(response).to have_key(:lat)
    expect(response).to have_key(:lng)
  end
end