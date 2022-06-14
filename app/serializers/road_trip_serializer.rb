class RoadTripSerializer
  def self.trip_and_weather(origin, destination, travel_time, arrival_weather)
    if arrival_weather.nil?
      {
        data: {
          id: nil,
          type: "roadtrip",
          attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: travel_time,
            weather_at_eta: {

            }
          }
        }
      }
    else
      {
        data: {
          id: nil,
          type: "roadtrip",
          attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: travel_time,
            weather_at_eta: {
              temperature: arrival_weather.temperature,
              conditions: arrival_weather.conditions
            }
          }
        }
      }
    end
  end
end