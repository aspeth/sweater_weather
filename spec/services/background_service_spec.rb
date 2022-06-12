require 'rails_helper'

RSpec.describe 'Background Facade' do
  it 'gets image information' do
    response = BackgroundService.get_image("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
  end
end