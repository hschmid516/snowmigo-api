class Api::V1::Trips::VotesController < ApplicationController
  def update
    if valid_params
      rider = Rider.by_user_and_trip(params[:user_id], params[:trip_id])
      rider.update(vote: params[:resort_id])
      Trip.find(params[:trip_id]).update_resort_votes
    else
      bad_request
    end
  end

  def update_status
    trip = Trip.find(params[:trip_id])
    trip.update(vote_status: params[:status], resort_id: trip.max_vote_resort)
  end

  private

  def valid_params
    params[:user_id].present? && params[:resort_id].present?
  end
end
