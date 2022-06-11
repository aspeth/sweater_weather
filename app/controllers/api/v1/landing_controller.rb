class Api::V1::LandingController < ApplicationController
  def forecast
    lat_long = MapquestFacade.get_lat_long(params[:location])
    weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])
    weather_poro = Weather.new(weather)
    render json: WeatherSerializer.forecast(weather_poro)
  end

  def backgrounds
    image_info = BackgroundFacade.get_image(params[:location])
    image_poro = Image.new(image_info[:results].sample)
  end
end