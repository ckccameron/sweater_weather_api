class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]

    lat = MapFacade.lat_long(location)[:lat]
    long = MapFacade.lat_long(location)[:lng]

    forecast = WeatherFacade.new(location).current_weather_summary

    trails = TrailsFacade.new(lat, long, location).trails

    render json: TrailsSerializer.new(HikingTrail.new(location, forecast, trails))
  end
end
