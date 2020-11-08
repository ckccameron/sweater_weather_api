class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = format_datetime(data[:date])
    @sunrise = format_datetime(data[:sunrise])
    @sunset = format_datetime(data[:sunset])
    @max_temp = data[:max_temp]
    @min_temp = data[:min_temp]
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

  def format_datetime(dt)
    Time.at(dt).strftime('%Y-%m-%d, %I:%M')
  end
end
