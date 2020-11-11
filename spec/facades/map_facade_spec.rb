require 'rails_helper'

describe MapFacade do
  it "returns latitude and longitude coordinates for a given location" do
    response = File.read("spec/fixtures/denver_mapquest_geocode.json")
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV["MAPQUEST_KEY"]}&location=denver,%20co")
      .to_return(status: 200, body: response)

    location = "denver, co"
    lat_long = MapFacade.lat_long(location)

    expect(lat_long).to be_a(Hash)
    expect(lat_long).to have_key(:lat)
    expect(lat_long[:lat]).to be_a(Float)
    expect(lat_long).to have_key(:lng)
    expect(lat_long[:lng]).to be_a(Float)
  end
end
