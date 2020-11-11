require 'rails_helper'

describe "road trip requests" do
  describe "when a user visits the landing page" do
    before :each do
      @user = User.create!(email: "boom@shakalaka.com", password: "pass123", password_confirmation: "pass123", api_key: "jgn983hy48thw9begh98h4539h4")
    end

    it "can accept a request body including starting city and destination city to create a road trip" do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": @user.api_key
      }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      road_trip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(road_trip).to have_key(:attributes)
      expect(road_trip[:attributes]).to be_a(Hash)

      expect(road_trip[:attributes]).to have_key(:origin)
      expect(road_trip[:attributes]).to have_key(:destination)
      expect(road_trip[:attributes]).to have_key(:travel_time)
      expect(road_trip[:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:attributes][:weather_at_eta]).to be_a(Hash)

      expect(road_trip[:attributes][:origin]).to be_a(String)
      expect(road_trip[:attributes][:destination]).to be_a(String)
      expect(road_trip[:attributes][:travel_time]).to be_a(String)

      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:attributes][:weather_at_eta]).to_not have_key(:sunrise)
      expect(road_trip[:attributes][:weather_at_eta]).to_not have_key(:sunset)
      expect(road_trip[:attributes][:weather_at_eta]).to_not have_key(:feels_like)
      expect(road_trip[:attributes][:weather_at_eta]).to_not have_key(:humidity)
      expect(road_trip[:attributes][:weather_at_eta]).to_not have_key(:visibility)
      expect(road_trip[:attributes][:weather_at_eta]).to_not have_key(:uvi)

      expect(road_trip[:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
      expect(road_trip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it "returns 400 status code with error message if origin and/or destination are not provided" do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "origin": "Denver, CO",
        "destination": "",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)
      expect(response.content_type).to eq("application/json")

      error_message = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(error_message).to be_a(Hash)

      expect(error_message).to have_key(:type)
      expect(error_message[:type]).to eq("error")

      expect(error_message).to have_key(:attributes)
      expect(error_message[:attributes]).to be_a(Hash)

      expect(error_message[:attributes]).to have_key(:message)
      expect(error_message[:attributes][:message]).to be_a(String)
      expect(error_message[:attributes][:message]).to eq("Bad Request - Origin and Destination must be given")
    end

    it "returns 401 status code with error message if api key is missing" do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "origin": "Denver, CO",
        "destination": "Pueblo, CO",
        "api_key": ""
      }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(401)
      expect(response.content_type).to eq("application/json")

      error_message = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(error_message).to be_a(Hash)

      expect(error_message).to have_key(:type)
      expect(error_message[:type]).to eq("error")

      expect(error_message).to have_key(:attributes)
      expect(error_message[:attributes]).to be_a(Hash)

      expect(error_message[:attributes]).to have_key(:message)
      expect(error_message[:attributes][:message]).to be_a(String)
      expect(error_message[:attributes][:message]).to eq("Unauthorized")
    end
  end
end
