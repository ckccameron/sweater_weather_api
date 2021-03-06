require 'rails_helper'

describe "city forecast requests" do
  describe "when a user visits the landing page" do
    it "can retrieve weather forecast for a given city" do
      data1 = File.read("spec/fixtures/denver_mapquest_geocode.json")
      stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=S4SXZhZF3pzXzFyReP6k0VK2gVy6jKDC&location=denver,co")
        .to_return(status: 200, body: data1)

      data2 = File.read("spec/fixtures/denver_open_weather_forecast.json")
      stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV["WEATHER_KEY"]}&exclude=minutely&lat=39.738453&lon=-104.984853&units=imperial")
        .to_return(status: 200, body: data2)

      city = "denver,co"
      get "/api/v1/forecast?location=#{city}"

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      denver_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(denver_forecast[:data]).to be_a(Hash)

      expect(denver_forecast[:data]).to have_key(:attributes)
      expect(denver_forecast[:data][:attributes]).to be_a(Hash)

      expect(denver_forecast[:data][:attributes]).to have_key(:current_weather)
      expect(denver_forecast[:data][:attributes][:current_weather]).to be_a(Hash)

      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(denver_forecast[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(denver_forecast[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
      expect(denver_forecast[:data][:attributes][:current_weather]).to_not have_key(:pressure)

      expect(denver_forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(denver_forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(denver_forecast[:data][:attributes][:current_weather][:humidity]).to_not be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:uvi]).to_not be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:visibility]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)

      expect(denver_forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(denver_forecast[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to be_a(Hash)

      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:date)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to have_key(:icon)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)
      expect(denver_forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)

      expect(denver_forecast[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
      expect(denver_forecast[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
      expect(denver_forecast[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)

      expect(denver_forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(denver_forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to be_a(Hash)

      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:time)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:feels_like)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:wind_speed)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:wind_direction)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)

      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Numeric)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:feels_like]).to be_a(Numeric)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:wind_speed]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:wind_direction]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)
    end

    it "can render bad request error if location is not given" do
      get "/api/v1/forecast?location="

      error_message = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(error_message).to be_a(Hash)

      expect(error_message).to have_key(:type)
      expect(error_message[:type]).to eq("error")

      expect(error_message).to have_key(:attributes)
      expect(error_message[:attributes]).to be_a(Hash)

      expect(error_message[:attributes]).to have_key(:message)
      expect(error_message[:attributes][:message]).to be_a(String)
      expect(error_message[:attributes][:message]).to eq("Bad Request - Location must be given")
    end
  end
end
