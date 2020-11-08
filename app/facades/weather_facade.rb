class WeatherFacade
  def initialize(location)
    @location = location
  end

  def weather_combined
    data = {
      current_weather: current,
      daily_weather: daily,
      hourly_weather: hourly
    }

    Weather.new(data)
  end

  def current
    data = {
      datetime: weather_service[:current][:dt],
      sunrise: weather_service[:current][:sunrise],
      sunset: weather_service[:current][:sunset],
      temperature: weather_service[:current][:temp],
      feels_like: weather_service[:current][:feels_like],
      humidity: weather_service[:current][:humidity],
      uvi: weather_service[:current][:uvi],
      visibility: weather_service[:current][:visibility],
      conditions: weather_service[:current][:weather][0][:description],
      icon: "http://openweathermap.org/img/wn/#{weather_service[:current][:weather][0][:icon]}.png"
    }

    CurrentWeather.new(data)
  end

  def daily
    weather_service[:daily][1..5].map do |weather_forecast|
      data = {
        date: weather_forecast[:dt],
        sunrise: weather_forecast[:sunrise],
        sunset: weather_forecast[:sunset],
        max_temp: weather_forecast[:temp][:max],
        min_temp: weather_forecast[:temp][:min],
        conditions: weather_forecast[:weather][0][:description],
        icon: "http://openweathermap.org/img/wn/#{weather_forecast[:weather][0][:icon]}.png"
      }

      DailyWeather.new(data)
    end
  end

  def hourly
    weather_service[:hourly][1..8].map do |weather_forecast|
      data = {
        time: weather_forecast[:dt],
        temperature: weather_forecast[:temp],
        feels_like: weather_forecast[:feels_like],
        wind_speed: weather_forecast[:wind_speed],
        wind_direction: weather_forecast[:wind_deg],
        conditions: weather_forecast[:weather][0][:description],
        icon: "http://openweathermap.org/img/wn/#{weather_forecast[:weather][0][:icon]}.png"
      }

      HourlyWeather.new(data)
    end
  end

  def weather_service
    WeatherService.new.get_weather(lat, long)
  end

  def map_service
    MapService.new.get_geocode(@location)[:results][0][:locations][0]
  end

  def lat
    map_service[:latLng][:lat]
  end

  def long
    map_service[:latLng][:lng]
  end
end
