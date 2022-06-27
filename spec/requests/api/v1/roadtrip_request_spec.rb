require 'rails_helper'

RSpec.describe 'roadtrip API' do
  it 'returns location and weather info' do
    User.create!(email: "email@mail.com", password: "yes", password_confirmation: "yes", api_key: "jgn983hy48thw9begh98h4539h4")
    data = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    post '/api/v1/road_trip', params: data, as: :json

    expect(response.status).to eq(200)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip).to have_key(:data)
    expect(road_trip.keys.count).to eq(1)
    
    data = road_trip[:data]
    expect(data).to have_key(:id)
    expect(data[:id]).to be nil
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("roadtrip")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data.keys.count).to eq(3)
    
    attributes = data[:attributes]
    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a(String)
    expect(attributes).to have_key(:end_city)
    expect(attributes[:end_city]).to be_a(String)
    expect(attributes).to have_key(:travel_time)
    expect(attributes[:travel_time]).to be_a(String)
    expect(attributes).to have_key(:weather_at_eta)
    expect(attributes[:weather_at_eta]).to be_a(Hash)
    expect(attributes.keys.count).to eq(4)

    weather = attributes[:weather_at_eta]
    expect(weather).to have_key(:temperature)
    expect(weather[:temperature]).to be_a(Float)
    expect(weather).to have_key(:conditions)
    expect(weather[:conditions]).to be_a(String)
    expect(weather.keys.count).to eq(2)
  end

  it "returns an error if no API key provided", :vcr do
    User.create!(email: "email@mail.com", password: "yes", password_confirmation: "yes", api_key: "jgn983hy48thw9begh98h4539h4")
    data = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": ""
    }
    post '/api/v1/road_trip', params: data, as: :json

    expect(response.status).to eq(401)
  end

  it "can handle a trip from NYC to LA", :vcr do
    User.create!(email: "email@mail.com", password: "yes", password_confirmation: "yes", api_key: "jgn983hy48thw9begh98h4539h4")
    data = {
      "origin": "New York, NY",
      "destination": "Los Angeles, CA",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    post '/api/v1/road_trip', params: data, as: :json

    expect(response.status).to eq(200)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip[:data][:attributes][:travel_time][0..1]).to eq("40")
  end

  it "returns an error if no route possible", :vcr do
    User.create!(email: "email@mail.com", password: "yes", password_confirmation: "yes", api_key: "jgn983hy48thw9begh98h4539h4")
    data = {
      "origin": "New York, NY",
      "destination": "London, UK",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    post '/api/v1/road_trip', params: data, as: :json

    expect(response.status).to eq(400)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip[:data][:attributes][:travel_time]).to eq("impossible")
    expect(road_trip[:data][:attributes][:weather_at_eta]).to eq({})
  end
end