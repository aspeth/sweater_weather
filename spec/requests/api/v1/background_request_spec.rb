require 'rails_helper'

RSpec.describe 'background image API' do
  it 'sends a background image for a city' do
    get '/api/v1/backgrounds?location=denver,co'

    
  end
end