require 'rails_helper'

describe CurrentWeather do
  before :each do
    @data = {
      :datetime=>1604807170,
      :sunrise=>1604756162,
      :sunset=>1604793077,
      :temperature=>60.78,
      :feels_like=>41.09,
      :humidity=>35,
      :uvi=>2.77,
      :visibility=>10000,
      :conditions=>"scattered clouds",
      :icon=>"http://openweathermap.org/img/wn/03n.png"
    }

    @weather = CurrentWeather.new(@data)
  end

  it "exists with attributes" do
    expect(@weather).to be_a(CurrentWeather)
    expect(@weather.datetime).to eq("2020-11-07, 07:46")
    expect(@weather.sunrise).to eq("2020-11-07, 05:36")
    expect(@weather.sunset).to eq("2020-11-07, 03:51")
    expect(@weather.temperature).to eq(60.78)
    expect(@weather.feels_like).to eq(41.09)
    expect(@weather.humidity).to eq(35)
    expect(@weather.uvi).to eq(2.77)
    expect(@weather.visibility).to eq("6.21 mi")
    expect(@weather.conditions).to eq("scattered clouds")
    expect(@weather.icon).to eq("http://openweathermap.org/img/wn/03n.png")
  end
end
