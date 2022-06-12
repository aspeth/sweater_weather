require 'rails_helper'

RSpec.describe 'user registration' do
  it 'accepts user info and returns api key', :vcr do
    data = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }

    post "/api/v1/users", params: data, as: :json
    
    expect(response).to be_successful
    
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
  
  it "sends an error mesage if email is already taken", :vcr do
    data = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }
  
    post "/api/v1/users", params: data, as: :json

    data = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }
  
    post "/api/v1/users", params: data, as: :json
    
    expect(response.status).to eq(400)
  end
end