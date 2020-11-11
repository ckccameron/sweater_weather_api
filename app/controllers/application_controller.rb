class ApplicationController < ActionController::API
  def authorization
    message = "Unauthorized"

    user = User.find_by(api_key: params[:api_key])

    if !user
      render json: ErrorSerializer.new(Error.new(message)), status: 401
    end
  end
end
