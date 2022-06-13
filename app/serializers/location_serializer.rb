class LocationSerializer
  def self.weather_and_books(weather, books, location)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: weather.conditions,
            temperature: weather.temperature
          }
        },
        total_books_found: books[1],
        books: books[0].each do |book|
          book
        end
      }
    }
  end
end