require 'rails_helper'

RSpec.describe "weather API" do
  it "sends the weather for a city" do
    get '/api/v1/forecast?location=denver,co'
    
    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)
    
    #check that data attribute is on level 0 and is the only key
    expect(forecast).to have_key(:data)
    expect(forecast.keys.count).to eq(1)

    # check for keys and values inside data key (level 1)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:id]).to eq nil
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data][:type]).to eq "forecast"
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to be_a(Hash)
    #check that only the keys above are present
    expect(forecast[:data].keys.count).to eq(3)
    
    #check for keys and data types inside attributes key (level 2)
    weather = forecast[:data][:attributes]
    expect(weather).to have_key(:current_weather)
    expect(weather[:current_weather]).to be_a(Hash)
    expect(weather).to have_key(:daily_weather)
    expect(weather[:daily_weather]).to be_an(Array)
    expect(weather).to have_key(:hourly_weather)
    expect(weather[:hourly_weather]).to be_an(Array)
    expect(weather.keys.count).to eq(3)
    
    #check for keys and data types inside current_weather key (level 3)
    current_weather = weather[:current_weather]

    expect(current_weather).to have_key(:datetime)
    expect(current_weather[:datetime]).to be_a(String)

    expect(current_weather).to have_key(:sunrise)
    expect(current_weather[:sunrise]).to be_a(String)

    expect(current_weather).to have_key(:sunset)
    expect(current_weather[:sunset]).to be_a(String)

    expect(current_weather).to have_key(:temperature)
    expect(current_weather[:temperature]).to be_a(Float)

    expect(current_weather).to have_key(:feels_like)
    expect(current_weather[:feels_like]).to be_a(Float)

    expect(current_weather).to have_key(:humidity)
    expect(current_weather[:humidity]).to be_an(Integer)

    expect(current_weather).to have_key(:uvi)
    expect(current_weather[:uvi]).to be_an(Float)

    expect(current_weather).to have_key(:visibility)
    expect(current_weather[:visibility]).to be_an(Integer)

    expect(current_weather).to have_key(:conditions)
    expect(current_weather[:conditions]).to be_a(String)

    expect(current_weather).to have_key(:icon)
    expect(current_weather[:icon]).to be_a(String)

    expect(current_weather.keys.count).to eq(10)
    
    #check for keys and values inside daily_weather key (level 3)
    daily_weather = weather[:daily_weather]
    expect(daily_weather).to be_an(Array)
    expect(daily_weather.count).to eq(5)

    daily_weather.each do |day|
      expect(day).to have_key(:date)
      expect(day[:date]).to be_a(String)
      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_a(String)
      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_a(String)
      expect(day).to have_key(:max_temp)
      expect(day[:max_temp]).to be_a(Float)
      expect(day).to have_key(:min_temp)
      expect(day[:min_temp]).to be_a(Float)
      expect(day).to have_key(:conditions)
      expect(day[:conditions]).to be_a(String)
      expect(day).to have_key(:icon)
      expect(day[:icon]).to be_a(String)
      expect(day.keys.count).to eq(7)
    end
    
    #check for keys and values inside hourly_weather key (level 3)
    hourly_weather = weather[:hourly_weather]
    expect(hourly_weather).to be_an(Array)
    expect(hourly_weather.count).to eq(8)

    hourly_weather.each do |hour|
      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)
      expect(hour).to have_key(:temperature)
      expect(hour[:temperature]).to be_a(Float)
      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)
      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
      expect(hour.keys.count).to eq(5)
    end
  end
end