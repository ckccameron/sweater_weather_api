class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]

    render json: ForecastSerializer.new(WeatherFacade.new(location).weather_combined)
    # if location.nil? || location.empty?
    #   render json: ErrorSerializer.new
    # end
  end
end
