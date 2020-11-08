require 'rails_helper'

describe DailyWeather do
  before :each do
    @data = {
      :date=>1604858400,
      :sunrise=>1604842631,
      :sunset=>1604879418,
      :max_temp=>58.68,
      :min_temp=>47.55,
      :conditions=>"clear sky",
      :icon=>"http://openweathermap.org/img/wn/01d.png"
    }

    @weather = DailyWeather.new(@data)
  end

  it "exists with attributes" do
    expect(@weather).to be_a(DailyWeather)
    expect(@weather.date).to eq("2020-11-08, 10:00")
    expect(@weather.sunrise).to eq("2020-11-08, 05:37")
    expect(@weather.sunset).to eq("2020-11-08, 03:50")
    expect(@weather.max_temp).to eq(58.68)
    expect(@weather.min_temp).to eq(47.55)
    expect(@weather.conditions).to eq("clear sky")
    expect(@weather.icon).to eq("http://openweathermap.org/img/wn/01d.png")
  end
end
