require 'rails_helper'

describe TrailsService do
  before :each do
    @service = TrailsService.new
  end

  it "exists" do
    expect(@service).to be_a(TrailsService)
  end

  it "returns trails info when given latitude and longitude for a location" do
    lat = 39.738453
    lon = -104.984853
    hiking_trails = @service.get_trails(lat, lon)

    expect(hiking_trails).to be_a(Hash)

    expect(hiking_trails[:trails]).to be_an(Array)

    expect(hiking_trails[:trails][0]).to have_key(:id)
    expect(hiking_trails[:trails][0]).to have_key(:name)
    expect(hiking_trails[:trails][0]).to have_key(:type)
    expect(hiking_trails[:trails][0]).to have_key(:summary)
    expect(hiking_trails[:trails][0]).to have_key(:difficulty)
    expect(hiking_trails[:trails][0]).to have_key(:stars)
    expect(hiking_trails[:trails][0]).to have_key(:location)
    expect(hiking_trails[:trails][0]).to have_key(:length)
    expect(hiking_trails[:trails][0]).to have_key(:ascent)
    expect(hiking_trails[:trails][0]).to have_key(:descent)
    expect(hiking_trails[:trails][0]).to have_key(:high)
    expect(hiking_trails[:trails][0]).to have_key(:low)
    expect(hiking_trails[:trails][0]).to have_key(:latitude)
    expect(hiking_trails[:trails][0]).to have_key(:longitude)

    expect(hiking_trails[:trails][0][:id]).to be_an(Integer)
    expect(hiking_trails[:trails][0][:name]).to be_a(String)
    expect(hiking_trails[:trails][0][:type]).to be_a(String)
    expect(hiking_trails[:trails][0][:summary]).to be_a(String)
    expect(hiking_trails[:trails][0][:difficulty]).to be_a(String)
    expect(hiking_trails[:trails][0][:stars]).to be_a(Numeric)
    expect(hiking_trails[:trails][0][:location]).to be_a(String)
    expect(hiking_trails[:trails][0][:length]).to be_a(Numeric)
    expect(hiking_trails[:trails][0][:ascent]).to be_a(Numeric)
    expect(hiking_trails[:trails][0][:descent]).to be_a(Numeric)
    expect(hiking_trails[:trails][0][:high]).to be_a(Numeric)
    expect(hiking_trails[:trails][0][:low]).to be_a(Numeric)
    expect(hiking_trails[:trails][0][:latitude]).to be_a(Float)
    expect(hiking_trails[:trails][0][:longitude]).to be_a(Float)
  end
end
