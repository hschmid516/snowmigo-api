class Api::V1::Trips::BaseController < ApplicationController
  private

  def set_trip
    Trip.find(params[:id])
  end

  def serialize(trip, status: :ok)
      render json: TripSerializer.new(trip), status: status
  end
end
