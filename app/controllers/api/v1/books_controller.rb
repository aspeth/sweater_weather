class Api::V1::BooksController < ApplicationController
  def results
    if params[:location] == "" || params[:quantity] == ""
      render json: { message: "all parameters must be provided" }, status: 400
    elsif params[:quantity].to_i < 0
      render json: { message: "quantity must be a positive number" }, status: 400
    else
      books = BooksFacade.get_books(params[:location], params[:quantity])
      lat_long = MapquestFacade.get_lat_long(params[:location])
      weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])
      weather_poro = Weather.new(weather)
      
      if books[1] == 0
        render json: { message: "no match found" }, status: 400
      else
        render json: LocationSerializer.weather_and_books(weather_poro, books, params[:location])
      end
    end
  end
end