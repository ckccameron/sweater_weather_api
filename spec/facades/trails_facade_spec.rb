require 'rails_helper'

describe TrailsFacade do
  it "returns results for trails near given location with information about each trail" do
    lat = 39.9388
    long = -105.2582
    location = "denver, co"
    trails = TrailsFacade.new(lat, long, location).trails

    expect(trails).to be_an(Array)

    expect(trails[0]).to be_a(Trail)
    expect(trails[0].name).to be_a(String)
    expect(trails[0].summary).to be_a(String)
    expect(trails[0].difficulty).to be_a(String)
    expect(trails[0].location).to be_a(String)
    expect(trails[0].distance_to_trail).to be_a(String)
  end
end
