require 'rails_helper'

describe WeatherService do
  before :each do
    response = File.read("spec/fixtures/denver_open_weather_forecast.json")
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV["WEATHER_KEY"]}&exclude=minutely&lat=39.738453&lon=-104.984853&units=imperial")
      .to_return(status: 200, body: response)

    @service = WeatherService.new
  end

  it "exists" do
    expect(@service).to be_a(WeatherService)
  end

  it "returns weather forecast data when given latitude and longitude for a location" do
    lat = 39.738453
    lon = -104.984853
    weather = @service.get_weather(lat, lon)

    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:lat)
    expect(weather[:lat]).to be_a(Float)
    expect(weather).to have_key(:lon)
    expect(weather[:lon]).to be_a(Float)

    expect(weather).to have_key(:current)
    expect(weather[:current]).to be_a(Hash)
    expect(weather[:current]).to have_key(:dt)
    expect(weather[:current]).to have_key(:sunrise)
    expect(weather[:current]).to have_key(:sunset)
    expect(weather[:current]).to have_key(:temp)
    expect(weather[:current]).to have_key(:feels_like)
    expect(weather[:current]).to have_key(:pressure)
    expect(weather[:current]).to have_key(:humidity)
    expect(weather[:current]).to have_key(:dew_point)
    expect(weather[:current]).to have_key(:uvi)
    expect(weather[:current]).to have_key(:clouds)
    expect(weather[:current]).to have_key(:visibility)
    expect(weather[:current]).to have_key(:wind_speed)
    expect(weather[:current]).to have_key(:wind_deg)
    expect(weather[:current]).to have_key(:weather)
    expect(weather[:current][:weather]).to be_an(Array)
    expect(weather[:current][:weather][0]).to have_key(:description)
    expect(weather[:current][:weather][0]).to have_key(:icon)

    expect(weather[:current][:dt]).to be_an(Integer)
    expect(weather[:current][:sunrise]).to be_an(Integer)
    expect(weather[:current][:sunset]).to be_an(Integer)
    expect(weather[:current][:temp]).to be_a(Float)
    expect(weather[:current][:feels_like]).to be_a(Float)
    expect(weather[:current][:weather][0][:description]).to be_a(String)
    expect(weather[:current][:weather][0][:icon]).to be_a(String)

    expect(weather).to have_key(:hourly)
    expect(weather[:hourly]).to be_an(Array)
    expect(weather[:hourly][0]).to have_key(:dt)
    expect(weather[:hourly][0]).to have_key(:temp)
    expect(weather[:hourly][0]).to have_key(:feels_like)
    expect(weather[:hourly][0]).to have_key(:pressure)
    expect(weather[:hourly][0]).to have_key(:humidity)
    expect(weather[:hourly][0]).to have_key(:dew_point)
    expect(weather[:hourly][0]).to have_key(:clouds)
    expect(weather[:hourly][0]).to have_key(:visibility)
    expect(weather[:hourly][0]).to have_key(:wind_speed)
    expect(weather[:hourly][0]).to have_key(:wind_deg)
    expect(weather[:hourly][0]).to have_key(:weather)
    expect(weather[:hourly][0][:weather]).to be_an(Array)
    expect(weather[:hourly][0][:weather][0]).to have_key(:description)
    expect(weather[:hourly][0][:weather][0]).to have_key(:icon)

    expect(weather[:hourly][0][:dt]).to be_an(Integer)
    expect(weather[:hourly][0][:temp]).to be_a(Float)
    expect(weather[:hourly][0][:feels_like]).to be_a(Float)
    expect(weather[:hourly][0][:weather][0][:description]).to be_a(String)
    expect(weather[:hourly][0][:weather][0][:icon]).to be_a(String)

    expect(weather).to have_key(:daily)
    expect(weather[:daily]).to be_an(Array)
    expect(weather[:daily][0]).to have_key(:dt)
    expect(weather[:daily][0]).to have_key(:sunrise)
    expect(weather[:daily][0]).to have_key(:sunset)
    expect(weather[:daily][0]).to have_key(:temp)
    expect(weather[:daily][0][:temp]).to be_a(Hash)
    expect(weather[:daily][0]).to have_key(:feels_like)
    expect(weather[:daily][0][:feels_like]).to be_a(Hash)
    expect(weather[:daily][0]).to have_key(:pressure)
    expect(weather[:daily][0]).to have_key(:humidity)
    expect(weather[:daily][0]).to have_key(:dew_point)
    expect(weather[:daily][0]).to have_key(:wind_speed)
    expect(weather[:daily][0]).to have_key(:wind_deg)
    expect(weather[:daily][0]).to have_key(:weather)
    expect(weather[:daily][0][:weather]).to be_an(Array)
    expect(weather[:daily][0][:weather][0]).to have_key(:description)
    expect(weather[:daily][0][:weather][0]).to have_key(:icon)

    expect(weather[:daily][0][:dt]).to be_an(Integer)
    expect(weather[:daily][0][:sunrise]).to be_an(Integer)
    expect(weather[:daily][0][:sunset]).to be_an(Integer)
    expect(weather[:daily][0][:temp][:day]).to be_a(Float)
    expect(weather[:daily][0][:temp][:night]).to be_a(Float)
    expect(weather[:daily][0][:feels_like][:day]).to be_a(Float)
    expect(weather[:daily][0][:feels_like][:night]).to be_a(Float)
    expect(weather[:daily][0][:weather][0][:description]).to be_a(String)
    expect(weather[:daily][0][:weather][0][:icon]).to be_a(String)
  end
end
