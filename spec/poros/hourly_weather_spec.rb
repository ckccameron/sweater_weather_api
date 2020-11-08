require 'rails_helper'

describe HourlyWeather do
  before :each do
    @data = {
      :time=>1604815200,
      :wind_speed=>11.43,
      :wind_direction=>270,
      :conditions=>"scattered clouds",
      :icon=>"http://openweathermap.org/img/wn/03n.png"
    }

    @weather = HourlyWeather.new(@data)
  end

  it "exists with attributes" do
    expect(@weather).to be_a(HourlyWeather)
    expect(@weather.time).to eq("10:00")
    expect(@weather.wind_speed).to eq("11 miles per hour")
    expect(@weather.wind_direction).to eq("W")
    expect(@weather.wind_direction).to_not eq("E")
    expect(@weather.wind_direction).to_not eq("N")
    expect(@weather.wind_direction).to_not eq("S")
    expect(@weather.conditions).to eq("scattered clouds")
    expect(@weather.icon).to eq("http://openweathermap.org/img/wn/03n.png")
  end
end
