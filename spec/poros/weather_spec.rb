# require 'rails_helper'
#
# describe Weather do
#   before :each do
#     @data = {
#       :current_weather=>
#         :conditions=>"few clouds",
#         :datetime=>"2020-11-07, 09:12",
#         :feels_like=>46.13,
#         :humidity=>36,
#         :icon=>"http://openweathermap.org/img/wn/02n.png",
#         :sunrise=>"2020-11-07, 05:36",
#         :sunset=>"2020-11-07, 03:51",
#         :temperature=>59.34,
#         :uvi=>2.77,
#         :visibility=>"6.21 mi",
#       :daily_weather=>
#         [
#           :conditions=>"clear sky",
#           :date=>"2020-11-08, 10:00",
#           :icon=>"http://openweathermap.org/img/wn/01d.png",
#           :max_temp=>58.68,
#           :min_temp=>47.53,
#           :sunrise=>"2020-11-08, 05:37",
#           :sunset=>"2020-11-08, 03:50"
#         ],
#       :hourly_weather=>
#         [
#           :conditions=>"scattered clouds",
#           :icon=>"http://openweathermap.org/img/wn/03n.png",
#           :time=>"10:00",
#           :wind_direction=>"S",
#           :wind_speed=>"11 miles per hour"
#         ]
#       }
#
#     @weather = Weather.new(@data)
#   end
#
#   it "exists with attributes" do
#     expect(@weather).to be_a(Weather)
#     expect(@weather.current_weather).to be_a(Hash)
#     expect(@weather.daily_weather).to be_an(Array)
#     expect(@weather.hourly_weather).to be_an(Array)
#   end
# end
