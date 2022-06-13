class Api::V1::BooksController < ApplicationController
  def results
    conn = Faraday.new("http://openlibrary.org/")
    response = conn.get("search.json?q=#{params[:location]}")
    JSON.parse(response.body, symbolize_names: true)

    lat_long = MapquestFacade.get_lat_long(params[:location])
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])
    weather_poro = Weather.new(weather)
  end
end