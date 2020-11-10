class Api::V1::UsersController < ApplicationController
  def create
    error_message = "Your credentials are bad"

    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      render json: UsersSerializer.new(user), status: 201
    else
      render json: ErrorSerializer.new(Error.new(error_message)), status: 401
    end

  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
