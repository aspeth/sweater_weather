class Api::V1::BooksController < ApplicationController
  def results
    books = BooksFacade.get_books(params[:location], params[:quantity])

    lat_long = MapquestFacade.get_lat_long(params[:location])
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])
    weather_poro = Weather.new(weather)

    render json: LocationSerializer.new(books, weather_poro)
  end
end