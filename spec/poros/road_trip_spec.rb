require 'rails_helper'

describe RoadTrip do
  before :each do
    @data = {
      :origin=>"los angeles, ca",
      :destination=>"san diego, ca",
      :travel_time=>7096,
      :travel_time_string=>"01:58:16",
      :forecast_at_eta=>
        {
          :conditions=>"clear sky",
          :temperature=>63.48
        }
    }

    @road_trip = RoadTrip.new(@data)
  end

  it "exists with attributes" do
    expect(@road_trip).to be_a(RoadTrip)
    expect(@road_trip.origin).to eq("los angeles, ca")
    expect(@road_trip.destination).to eq("san diego, ca")
    expect(@road_trip.travel_time).to eq("01 hr, 58 min")
    expect(@road_trip.weather_at_eta).to eq({:conditions=>"clear sky", :temperature=>63.48})
  end
end
