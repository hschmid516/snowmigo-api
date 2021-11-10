class Api::V1::Trips::VotesController < Api::V1::Trips::BaseController
  def update
    if valid_params
      rider = Rider.by_user_and_trip(params[:user_id], params[:trip_id])
      rider.update(vote: params[:resort_id])
      Trip.find(params[:trip_id]).update_resort_votes
      render json: { data: 'Vote successfully updated!'}
    else
      bad_request
    end
  end

  def update_status
    if params[:open] == 'false'
      trip = Trip.find(params[:trip_id])
      trip.update(vote_status: 'closed', resort_id: trip.max_vote_resort)
    end
    serialize(trip)
  end

  private

  def valid_params
    params[:user_id].present? && params[:resort_id].present?
  end
end
