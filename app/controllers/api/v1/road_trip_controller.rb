class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { message: "invalid API key" }, status: 401
    else
      lat_long = MapquestFacade.get_lat_long(params[:destination])
      weather = WeatherFacade.get_weather(lat_long[:lat], lat_long[:lng])
      weather_poro = Weather.new(weather, 48)
      travel_info = MapquestFacade.get_directions(params[:origin], params[:destination])[:route]
      formatted_travel_time = travel_info[:formattedTime]
      arrival_time = Time.now + travel_info[:legs][0][:time]
      arrival_weather = weather_poro.hourly_weather[formatted_travel_time[0..1].to_i]

      render json: RoadTripSerializer.trip_and_weather(params[:origin], params[:destination],formatted_travel_time, arrival_weather)
    end
  end
end