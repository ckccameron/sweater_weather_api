require 'rails_helper'

describe RoadTripFacade do
  it "returns road trip summary that includes forecast and travel time" do
    origin = "los angeles, ca"
    destination = "san diego, ca"
    road_trip = RoadTripFacade.new(origin, destination).road_trip

    expect(road_trip).to be_a(RoadTrip)
  end
end
