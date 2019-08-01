class RegistrationsController < ApplicationController
  def create
    user = User.create(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password]
    )
    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 422 }
    end
  end
end