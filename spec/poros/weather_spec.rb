require 'rails_helper'

describe Weather do
  before :each do
    @data = {
      :current_weather=>
        {
          :conditions=>"few clouds",
          :datetime=>"2020-11-10, 09:37",
          :feels_like=>24.12,
          :humidity=>68,
          :icon=>"http://openweathermap.org/img/wn/02n.png",
          :sunrise=>"2020-11-10, 05:39",
          :sunset=>"2020-11-10, 03:48",
          :temperature=>33.84,
          :uvi=>2.47,
          :visibility=>"6.21 mi"
        },
      :daily_weather=>
        [
          {
            :conditions=>"clear sky",
            :date=>"2020-11-11, 10:00",
            :icon=>"http://openweathermap.org/img/wn/01d.png",
            :max_temp=>49.44,
            :min_temp=>34.14,
            :sunrise=>"2020-11-11, 05:40",
            :sunset=>"2020-11-11, 03:47"
          },
          {
            :conditions=>"clear sky",
            :date=>"2020-11-12, 10:00",
            :icon=>"http://openweathermap.org/img/wn/01d.png",
            :max_temp=>45.61,
            :min_temp=>33.78,
            :sunrise=>"2020-11-12, 05:41",
            :sunset=>"2020-11-12, 03:46"
          }
        ],
      :hourly_weather=>
        [
          {
            :conditions=>"scattered clouds",
            :feels_like=>30.15,
            :icon=>"http://openweathermap.org/img/wn/03n.png",
            :temperature=>36.19,
            :time=>"10:00",
            :wind_direction=>"W",
            :wind_speed=>"3 miles per hour"
          },
          {
            :conditions=>"clear sky",
            :feels_like=>30.83,
            :icon=>"http://openweathermap.org/img/wn/01n.png",
            :temperature=>37,
            :time=>"11:00",
            :wind_direction=>"W",
            :wind_speed=>"3 miles per hour"
          }
        ]
    }
    @weather = Weather.new(@data)
  end

  it "exists with attributes" do
    expect(@weather).to be_a(Weather)

    expect(@weather.current_weather).to be_a(Hash)
    expect(@weather.current_weather[:conditions]).to eq("few clouds")
    expect(@weather.current_weather[:datetime]).to eq("2020-11-10, 09:37")
    expect(@weather.current_weather[:feels_like]).to eq(24.12)
    expect(@weather.current_weather[:humidity]).to eq(68)
    expect(@weather.current_weather[:icon]).to eq("http://openweathermap.org/img/wn/02n.png")
    expect(@weather.current_weather[:sunrise]).to eq("2020-11-10, 05:39")
    expect(@weather.current_weather[:sunset]).to eq("2020-11-10, 03:48")
    expect(@weather.current_weather[:temperature]).to eq(33.84)
    expect(@weather.current_weather[:uvi]).to eq(2.47)
    expect(@weather.current_weather[:visibility]).to eq("6.21 mi")

    expect(@weather.daily_weather).to be_an(Array)
    expect(@weather.daily_weather[0][:conditions]).to eq("clear sky")
    expect(@weather.daily_weather[0][:date]).to eq("2020-11-11, 10:00")
    expect(@weather.daily_weather[0][:icon]).to eq("http://openweathermap.org/img/wn/01d.png")
    expect(@weather.daily_weather[0][:max_temp]).to eq(49.44)
    expect(@weather.daily_weather[0][:min_temp]).to eq(34.14)
    expect(@weather.daily_weather[0][:sunrise]).to eq("2020-11-11, 05:40")
    expect(@weather.daily_weather[0][:sunset]).to eq("2020-11-11, 03:47")

    expect(@weather.hourly_weather).to be_an(Array)
    expect(@weather.hourly_weather[0][:conditions]).to eq("scattered clouds")
    expect(@weather.hourly_weather[0][:feels_like]).to eq(30.15)
    expect(@weather.hourly_weather[0][:icon]).to eq("http://openweathermap.org/img/wn/03n.png")
    expect(@weather.hourly_weather[0][:temperature]).to eq(36.19)
    expect(@weather.hourly_weather[0][:time]).to eq("10:00")
    expect(@weather.hourly_weather[0][:wind_direction]).to eq("W")
    expect(@weather.hourly_weather[0][:wind_speed]).to eq("3 miles per hour")
  end
end
