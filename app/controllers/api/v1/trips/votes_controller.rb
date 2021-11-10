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
      close_vote
    elsif params[:open] == 'true'
      open_vote
    else
      bad_request
    end
  end

  private

  def valid_params
    params[:user_id].present? && params[:resort_id].present?
  end

  def open_vote
    trip = Trip.find(params[:trip_id])
    trip.resort_options.create({ resort_id: trip.resort_id, resort_name: trip.resort_name})
    trip.update({vote_status: 'open', resort_id: nil, resort_name: nil})
    serialize(trip)
  end

  def close_vote
    trip = Trip.find(params[:trip_id])
    trip.update(vote_status: 'closed', resort_id: trip.max_vote_resort)
    trip.resort_options.destroy_all
    serialize(trip)
  end
end
