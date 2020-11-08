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

    expect(weather).to be_a(Hash)
  end
end
