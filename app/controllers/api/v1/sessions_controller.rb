class Api::V1::SessionsController < ApplicationController
  def create
    error_message = "Your credentials are bad"

    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: ErrorSerializer.new(Error.new(error_message)), status: 400
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
