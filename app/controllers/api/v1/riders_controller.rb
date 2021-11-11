class Api::V1::RidersController < ApplicationController
  def create
    rider = Rider.create!(rider_params)

    render json: RiderSerializer.new(rider), status: :created
  end

  private
  def rider_params
    params.require(:rider).permit(:trip_id, :user_id, :driver, :budget)
  end
end
