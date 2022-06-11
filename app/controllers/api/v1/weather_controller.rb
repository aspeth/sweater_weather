class Api::V1::WeatherController < ApplicationController
  def landing
    lat_long = MapquestFacade.get_lat_long(params[:location])
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])
    weather_poro = Weather.new(weather)
    render json: WeatherSerializer.forecast(weather_poro)
  end
end