require 'rails_helper'

describe TrailsFacade do
  it "returns results for trails near given location with information about each trail" do
    lat = 39.9388
    long = -105.2582
    location = "denver, co"
    trails = TrailsFacade.new(lat, long, location).trails

    expect(trails).to be_an(Array)
    expect(trails[0]).to be_a(Trail)
  end
end
