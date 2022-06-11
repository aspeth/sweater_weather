class WeatherSerializer
  include JSONAPI::Serializer
  # attributes  :datetime,
  #             :sunrise,
  #             :sunset,
  #             :temperature,
  #             :feels_like,
  #             :humidity,
  #             :uvi,
  #             :visibility,
  #             :conditions,
  #             :icon

  def self.forecast(weather)
    {
      "data":
        {
          id: nil,
          type: "forecast",
          attributes: {
            current_weather: {
              datetime: weather.datetime,
              sunrise: weather.sunrise,
              sunset: weather.sunset,
              temperature: weather.temperature,
              feels_like: weather.feels_like,
              humidity: weather.humidity,
              uvi: weather.uvi,
              visibility: weather.visibility,
              conditions: weather.conditions,
              icon: weather.icon
            },
            daily_weather: weather.daily_weather
          }
        }
    }
  end

#   class BookSerializer
#     include JSONAPI::Serializer

#     attributes :title, :author, :genre, :summary_length
#     # def self.all_books(books)
#     #     {
#     #         "data": books.map do |book|
#     #             {
#     #                 "id": book.id.to_s,
#     #                 "type": "book",
#     #                 "attributes": {
#     #                     "title": book.title,
#     #                     "author": book.author,
#     #                     "summary_character_length": book.summary_length
#     #                 }
#     #             }
#     #         end 
#     #     }
#     # end
# end 
end