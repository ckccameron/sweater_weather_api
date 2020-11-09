class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]

    map = MapFacade.lat_long(location)
    lat = MapFacade.lat_long(location)[:lat]
    lon = MapFacade.lat_long(location)[:lng]
    weather = WeatherFacade.new(location).current_weather_temp_and_summary
    trails = TrailsFacade.trails(lat, lon)
  end
end
