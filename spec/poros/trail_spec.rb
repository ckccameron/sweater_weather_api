require 'rails_helper'

describe Trail do
  before :each do
    @location = "denver, co"
    @data = {
      :id=>7011192,
      :name=>"Boulder Skyline Traverse",
      :type=>"Recommended Route",
      :summary=>"The classic long mountain route in Boulder.",
      :difficulty=>"black",
      :stars=>4.7,
      :starVotes=>93,
      :location=>"Superior, Colorado",
      :url=>"https://www.hikingproject.com/trail/7011192/boulder-skyline-traverse",
      :imgSqSmall=>"https://cdn2.apstatic.com/photos/hike/7039883_sqsmall_1555092747.jpg",
      :imgSmall=>"https://cdn2.apstatic.com/photos/hike/7039883_small_1555092747.jpg",
      :imgSmallMed=>"https://cdn2.apstatic.com/photos/hike/7039883_smallMed_1555092747.jpg",
      :imgMedium=>"https://cdn2.apstatic.com/photos/hike/7039883_medium_1555092747.jpg",
      :length=>17.3,
      :ascent=>5446,
      :descent=>-5524,
      :high=>8446,
      :low=>5424,
      :longitude=>-105.2582,
      :latitude=>39.9388,
      :conditionStatus=>"All Clear",
      :conditionDetails=>"Dry",
      :conditionDate=>"2020-09-16 14:37:11"
      }

    @trail = Trail.new(@data, @location)
  end

  it "exists with attributes" do
    expect(@trail).to be_a(Trail)
    expect(@trail.name).to eq("Boulder Skyline Traverse")
    expect(@trail.summary).to eq("The classic long mountain route in Boulder.")
    expect(@trail.difficulty).to eq("black")
    expect(@trail.location).to eq("Superior, Colorado")
    expect(@trail.latitude).to eq(39.9388)
    expect(@trail.longitude).to eq(-105.2582)
    expect(@trail.distance_to_trail).to eq("5.973")
  end
end
