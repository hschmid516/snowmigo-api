class Api::V1::Users::BaseController < ApplicationController
  private

  def set_user
    User.find(params[:id])
  end

  def serialize(user, options: nil, status: :ok)
    if options
      render json: UserSerializer.new(user, options), status: status
    else
      render json: UserSerializer.new(user), status: status
    end
  end
end
