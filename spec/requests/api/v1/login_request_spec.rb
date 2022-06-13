require 'rails_helper'

RSpec.describe 'user login' do
  it 'returns api key if user is validated' do
    User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "very_secure_key")

    data = {
      "email": "whatever@example.com",
      "password": "password"
    }
    
    post '/api/v1/sessions', params: data, as: :json

    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)
    
    expect(user).to have_key(:data)
    expect(user.keys.count).to eq(1)
    
    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("users")
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_an(Integer)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data].keys.count).to eq(3)
    
    user_info = user[:data][:attributes]
    
    expect(user_info.keys.count).to eq(2)
    expect(user_info).to have_key(:email)
    expect(user_info[:email]).to eq(data[:email])
    expect(user_info).to have_key(:api_key)
    expect(user_info[:api_key]).to be_a(String)
  end

  it "returns error if credentials are incorrect" do
    User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "very_secure_key")

    data = {
      "email": "whatever@example.com",
      "password": "notmypassword"
    }
    
    post '/api/v1/sessions', params: data, as: :json

    expect(response.status).to eq(401)
  end

  it "returns error if credentials are incorrect" do
    User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "very_secure_key")

    data = {
      "email": "wrongemail@example.com",
      "password": "password"
    }
    
    post '/api/v1/sessions', params: data, as: :json

    expect(response.status).to eq(401)
  end
end