require 'rails_helper'

describe RoadTripFacade do
  it "returns road trip summary that includes forecast and travel time" do
    origin = "los angeles, ca"
    destination = "san diego, ca"
    road_trip = RoadTripFacade.new(origin, destination).road_trip

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.origin).to eq(origin)
    expect(road_trip.origin).to be_a(String)
    expect(road_trip.destination).to eq(destination)
    expect(road_trip.destination).to be_a(String)
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.travel_time).to_not include(":")
    expect(road_trip.forecast_at_eta).to be_a(RoadTripWeatherSummary)
    expect(road_trip.forecast_at_eta.temperature).to be_a(Float)
    expect(road_trip.forecast_at_eta.conditions).to be_a(String)
  end
end
