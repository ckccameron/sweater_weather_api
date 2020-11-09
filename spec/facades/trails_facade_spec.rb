require 'rails_helper'

describe TrailsFacade do
  it "returns results for trails near given location with information about each trail" do
    location = "denver, co"
    trails = TrailsFacade.new(location).trails

    expect(trails).to be_an(Array)
    expect(trails[0]).to be_a(Trail)
  end
end
