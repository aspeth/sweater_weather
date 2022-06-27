require 'rails_helper'

RSpec.describe 'background image API' do
  it 'sends a background image for a city', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image).to have_key(:data)
    expect(image.keys.count).to eq(1)

    expect(image[:data]).to be_a(Hash)
    expect(image[:data]).to have_key(:type)
    expect(image[:data][:type]).to be_a(String)
    expect(image[:data]).to have_key(:id)
    expect(image[:data][:id]).to be nil
    expect(image[:data]).to have_key(:attributes)
    expect(image[:data][:attributes]).to be_a(Hash)
    expect(image[:data].keys.count).to eq(3)
    
    attributes = image[:data][:attributes]
    
    expect(attributes).to have_key(:location)
    expect(attributes[:location]).to be_a(String)
    expect(attributes).to have_key(:image_url)
    expect(attributes[:image_url]).to be_a(String)
    expect(attributes).to have_key(:credit)
    expect(attributes[:credit]).to be_a(Hash)
    expect(attributes.keys.count).to eq(3)
    
    credit = attributes[:credit]
    
    expect(credit).to have_key(:source)
    expect(credit[:source]).to be_a(String)
    expect(credit).to have_key(:user)
    expect(credit[:user]).to be_a(String)
    expect(credit).to have_key(:user_url)
    expect(credit[:user_url]).to be_a(String)
    expect(credit.keys.count).to eq(3)
  end
end