require 'rails_helper'

describe "city forecast requests" do
  describe "when a user visits the landing page" do
    it "can retrieve weather forecast for a given city" do
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
      expect(denver_forecast[:data][:attributes][:current_weather][:visibility]).to_not be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)

      expect(denver_forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(denver_forecast[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to be_a(Hash)

      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:date)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:sunset)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:conditions)
      expect(denver_forecast[:data][:attributes][:daily_weather].first).to have_key(:icon)
      expect(denver_forecast[:data][:attributes][:daily_weather]).to_not have_key(:dew_point)
      expect(denver_forecast[:data][:attributes][:daily_weather]).to_not have_key(:pressure)

      expect(denver_forecast[:data][:attributes][:daily_weather].first[:date]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather].first[:sunrise]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather].first[:sunset]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather].first[:max_temp]).to be_a(Float)
      expect(denver_forecast[:data][:attributes][:daily_weather].first[:min_temp]).to be_a(Float)
      expect(denver_forecast[:data][:attributes][:daily_weather].first[:conditions]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:daily_weather].first[:icon]).to be_a(String)

      expect(denver_forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(denver_forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first).to be_a(Hash)

      expect(denver_forecast[:data][:attributes][:hourly_weather].first).to have_key(:time)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first).to have_key(:wind_speed)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first).to have_key(:wind_direction)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first).to have_key(:icon)
      expect(denver_forecast[:data][:attributes][:hourly_weather]).to_not have_key(:dew_point)
      expect(denver_forecast[:data][:attributes][:hourly_weather]).to_not have_key(:pressure)

      expect(denver_forecast[:data][:attributes][:hourly_weather].first[:time]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first[:wind_speed]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first[:wind_direction]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first[:conditions]).to be_a(String)
      expect(denver_forecast[:data][:attributes][:hourly_weather].first[:icon]).to be_a(String)
    end
  end
end