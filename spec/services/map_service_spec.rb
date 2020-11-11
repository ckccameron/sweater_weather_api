require 'rails_helper'

describe MapService do
  before :each do
    # response = File.read("spec/fixtures/denver_mapquest_geocode.json")
    # stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV["MAPQUEST_KEY"]}&location=denver,%20co")
    #   .to_return(status: 200, body: response)

    @service = MapService.new
  end

  it "exists" do
    expect(@service).to be_a(MapService)
  end

  it "returns geocoding data for a given location" do
    location = "denver, co"
    geocode_data = @service.get_geocode(location)

    expect(geocode_data).to have_key(:results)
    expect(geocode_data[:results]).to be_an(Array)

    expect(geocode_data[:results][0]).to have_key(:locations)
    expect(geocode_data[:results][0][:locations]).to be_an(Array)

    expect(geocode_data[:results][0][:locations][0]).to be_a(Hash)
    expect(geocode_data[:results][0][:locations][0]).to have_key(:adminArea5)
    expect(geocode_data[:results][0][:locations][0]).to have_key(:adminArea5Type)
    expect(geocode_data[:results][0][:locations][0][:adminArea5]).to be_a(String)
    expect(geocode_data[:results][0][:locations][0][:adminArea5Type]).to be_a(String)
    expect(geocode_data[:results][0][:locations][0][:adminArea5Type]).to eq("City")

    expect(geocode_data[:results][0][:locations][0]).to have_key(:adminArea3)
    expect(geocode_data[:results][0][:locations][0]).to have_key(:adminArea3Type)
    expect(geocode_data[:results][0][:locations][0][:adminArea3]).to be_a(String)
    expect(geocode_data[:results][0][:locations][0][:adminArea3Type]).to be_a(String)
    expect(geocode_data[:results][0][:locations][0][:adminArea3Type]).to eq("State")

    expect(geocode_data[:results][0][:locations][0]).to have_key(:adminArea1)
    expect(geocode_data[:results][0][:locations][0]).to have_key(:adminArea1Type)
    expect(geocode_data[:results][0][:locations][0][:adminArea1]).to be_a(String)
    expect(geocode_data[:results][0][:locations][0][:adminArea1Type]).to be_a(String)
    expect(geocode_data[:results][0][:locations][0][:adminArea1Type]).to eq("Country")

    expect(geocode_data[:results][0][:locations][0]).to have_key(:latLng)
    expect(geocode_data[:results][0][:locations][0][:latLng]).to be_a(Hash)
    expect(geocode_data[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(geocode_data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
    expect(geocode_data[:results][0][:locations][0][:latLng]).to have_key(:lng)
    expect(geocode_data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
  end

  it "returns route data to show travel distance between origin and destination" do
    origin = "los angeles, ca"
    destination = "san diego, ca"
    route_data = @service.get_distance_between(origin, destination)

    expect(route_data).to have_key(:route)
    expect(route_data[:route]).to be_a(Hash)

    expect(route_data[:route]).to have_key(:distance)
    expect(route_data[:route]).to have_key(:formattedTime)
    expect(route_data[:route]).to have_key(:sessionId)
    expect(route_data[:route]).to have_key(:realTime)
    expect(route_data[:route]).to have_key(:legs)

    expect(route_data[:route][:distance]).to be_a(Float)
    expect(route_data[:route][:formattedTime]).to be_a(String)
    expect(route_data[:route][:sessionId]).to be_a(String)
    expect(route_data[:route][:realTime]).to be_an(Integer)
    expect(route_data[:route][:legs]).to be_an(Array)
  end
end
