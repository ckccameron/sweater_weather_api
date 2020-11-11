require 'rails_helper'

describe RoadTripWeatherSummary do
  before :each do
    @data = {
      :dt=>1605042000,
      :temp=>63.46,
      :feels_like=>55.35,
      :pressure=>1018,
      :humidity=>30,
      :dew_point=>31.57,
      :clouds=>0,
      :visibility=>10000,
      :wind_speed=>7.94,
      :wind_deg=>296,
      :weather=>
        [
          {
            :id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"
          }
        ],
      :pop=>0
    }

    @weather_summary = RoadTripWeatherSummary.new(@data)
  end

  it "exists with attributes" do
    expect(@weather_summary).to be_a(RoadTripWeatherSummary)
    expect(@weather_summary.temperature).to eq(63.46)
    expect(@weather_summary.conditions).to eq("clear sky")
  end
end
