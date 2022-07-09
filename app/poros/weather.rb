class Weather
  attr_reader :id,
              :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :daily_weather,
              :hourly_weather

  def initialize(data, hours)
    @id = nil
    @datetime = Time.at(data[:current][:dt])
    @sunrise = Time.at(data[:current][:sunrise])
    @sunset = Time.at(data[:current][:sunset])
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like].to_f
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
    @daily_weather = data[:daily].first(5).map do |day|
      DailyWeather.new(day)
    end
    @hourly_weather = data[:hourly].first(hours).map do |hour|
      HourlyWeather.new(hour)
    end
  end
end