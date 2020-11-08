class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon
              
  def initialize(data)
    @datetime = format_datetime(data[:datetime])
    @sunrise = format_datetime(data[:sunrise])
    @sunset = format_datetime(data[:sunset])
    @temperature = data[:temperature]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = format_visibility(data[:visibility])
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

  def format_datetime(dt)
    Time.at(dt).strftime('%Y-%m-%d, %I:%M')
  end

  def format_visibility(data)
    "#{(data * 0.000621)} mi"
  end
end
