class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.hex(10))
    render json: UsersSerializer.create_new(user)
  end
end