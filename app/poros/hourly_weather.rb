class HourlyWeather
  attr_reader :time,
              :temperature,
              :feels_like,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = format_time(data[:time])
    @temperature = data[:temperature]
    @feels_like = data[:feels_like]
    @wind_speed = format_wind_speed(data[:wind_speed])
    @wind_direction = format_wind_direction(data[:wind_direction])
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

  def format_time(time)
    Time.at(time).strftime('%I:%M')
  end

  def format_wind_speed(speed)
    "#{speed.round(0)} miles per hour"
  end

  def format_wind_direction(wind_deg)
    if wind_deg.between?(45, 135)
      "E"
    elsif wind_deg.between?(135, 225)
      "S"
    elsif wind_deg.between?(225, 315)
      "W"
    else
      "N"
    end
  end
end
