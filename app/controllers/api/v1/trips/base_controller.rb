class Api::V1::Trips::BaseController < ApplicationController
  private

  def set_trip
    Trip.find(params[:id])
  end

  def serialize(trip, options: nil, status: :ok)
    if options
      render json: TripSerializer.new(trip, options), status: status
    else
      render json: TripSerializer.new(trip), status: status
    end
  end
end
