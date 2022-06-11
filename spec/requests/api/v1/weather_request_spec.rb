require 'rails_helper'

RSpec.describe "weather API" do
  it "sends the weather for a city" do
    get '/api/v1/forecast?location=denver,co'
    
    expect(response).to be_successful
    require 'pry'; binding.pry
  end
end