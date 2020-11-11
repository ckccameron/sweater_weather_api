class Api::V1::RoadTripController < ApplicationController
  def create
    origin = road_trip_params[:origin]
    destination = road_trip_params[:destination]
    api_key = road_trip_params[:api_key]
    error_message1 = "Bad Request - Origin and Destination must be given"
    error_message2 = "Unauthorized"

    if (origin.nil? || origin.empty? ||destination.nil? || destination.empty?)
      render json: ErrorSerializer.new(Error.new(error_message1)), status: 400
    elsif (api_key.nil? || api_key.empty?)
      render json: ErrorSerializer.new(Error.new(error_message2)), status: 401
    else
      render json: RoadTripSerializer.new(RoadTripFacade.new(origin, destination).road_trip), status: 200
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
