class Api::V1::Users::BaseController < ApplicationController
  private

  def set_user
    User.find(params[:id])
  end

  def serialize(user, status = :ok)
    render json: UserSerializer.new(user), status: status
  end
end
