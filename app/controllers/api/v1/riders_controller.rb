class Api::V1::RidersController < ApplicationController
  def create
    if !params[:user_id]
      record_not_found
    else
      rider = Rider.create!(rider_params)
      render json: RiderSerializer.new(rider), status: :created
    end
  end

  private

  def rider_params
    {trip_id: params[:trip_id],
      driver: params[:driver],
      budget: params[:budget],
      user_id: params[:user_id]}
  end
end
