require 'rails_helper'

describe WeatherFacade do
  # before :each do
  #   response = File.read("spec/fixtures/denver_open_weather_forecast.json")
  #   stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV["WEATHER_KEY"]}&exclude=minutely&lat=39.738453&lon=-104.984853&units=imperial")
  #     .to_return(status: 200, body: response)
  # end

  it "returns current, daily and hourly weather forecast for a given location" do
    location = 'denver, co'
    weather = WeatherFacade.new(location).weather_combined

    expect(weather).to be_a(Weather)

    expect(weather.current_weather).to be_a(CurrentWeather)
    expect(weather.current_weather.datetime).to be_a(String)
    expect(weather.current_weather.sunrise).to be_a(String)
    expect(weather.current_weather.sunset).to be_a(String)
    expect(weather.current_weather.temperature).to be_a(Numeric)
    expect(weather.current_weather.feels_like).to be_a(Numeric)
    expect(weather.current_weather.conditions).to be_a(String)
    expect(weather.current_weather.icon).to be_a(String)

    expect(weather.daily_weather[0]).to be_a(DailyWeather)
    expect(weather.daily_weather[0].date).to be_a(String)
    expect(weather.daily_weather[0].sunrise).to be_a(String)
    expect(weather.daily_weather[0].sunset).to be_a(String)
    expect(weather.daily_weather[0].max_temp).to be_a(Numeric)
    expect(weather.daily_weather[0].min_temp).to be_a(Numeric)
    expect(weather.daily_weather[0].conditions).to be_a(String)
    expect(weather.daily_weather[0].icon).to be_a(String)

    expect(weather.hourly_weather[0]).to be_an(HourlyWeather)
    expect(weather.hourly_weather[0].time).to be_a(String)
    expect(weather.hourly_weather[0].temperature).to be_a(Numeric)
    expect(weather.hourly_weather[0].feels_like).to be_a(Numeric)
    expect(weather.hourly_weather[0].wind_speed).to be_a(String)
    expect(weather.hourly_weather[0].wind_direction).to be_a(String)
    expect(weather.hourly_weather[0].conditions).to be_a(String)
    expect(weather.hourly_weather[0].icon).to be_a(String)
  end
end
