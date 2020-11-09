class Api::V1::BackgroundController < ApplicationController
  def index
    location = params[:location]
    error_message = "Bad Request - Location must be given"

    if location.nil? || location.empty?
      render json: ErrorSerializer.new(Error.new(error_message)), status: 400
    else
      render json: BackgroundImageSerializer.new(BackgroundImageFacade.new(location).image)
    end
  end
end
