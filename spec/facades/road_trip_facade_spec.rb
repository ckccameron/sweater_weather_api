require 'rails_helper'

describe RoadTripFacade do

  it "returns road trip summary that includes forecast and travel time" do
    response1 = File.read("spec/fixtures/denver_to_san_diego_mapquest_route.json")
    stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=denver,%20co&key=#{ENV["MAPQUEST_KEY"]}&to=san%20diego,%20ca")
      .to_return(status: 200, body: response1)

    response2 = File.read("spec/fixtures/san_diego_mapquest_geocode.json")
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV["MAPQUEST_KEY"]}&location=san%20diego,%20ca")
      .to_return(status: 200, body: response2)

    response3 = File.read("spec/fixtures/san_diego_open_weather_forecast.json")
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV["WEATHER_KEY"]}&exclude=minutely&lat=32.71576&lon=-117.163817&units=imperial")
      .to_return(status: 200, body: response3)

    origin = "denver, co"
    destination = "san diego, ca"
    road_trip = RoadTripFacade.new(origin, destination).road_trip
    # binding.pry
    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.origin).to eq(origin)
    expect(road_trip.origin).to be_a(String)
    expect(road_trip.destination).to eq(destination)
    expect(road_trip.destination).to be_a(String)
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.travel_time).to_not include(":")
    expect(road_trip.weather_at_eta).to be_a(RoadTripWeatherSummary)
    expect(road_trip.weather_at_eta.temperature).to be_a(Float)
    expect(road_trip.weather_at_eta.conditions).to be_a(String)
  end
end
