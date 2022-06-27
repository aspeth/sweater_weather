class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon,
              :date

  def initialize(data)
    @date = Time.at(data[:dt])
    @time = Time.at(data[:dt]).strftime("%H:%M:%S")
    @temperature = data[:temp].to_f
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end