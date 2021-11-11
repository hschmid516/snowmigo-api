class Api::V1::TripsController < Api::V1::Trips::BaseController
  before_action only: %i[show update destroy] do
    @trip = set_trip
  end

  def index
    trips = Trip.all
    serialize(trips)
  end

  def show
    serialize(@trip)
  end

  def create
    trip = Trip.create!(trip_params)
    trip.riders.create!({user_id: params[:user_id], host: true})
    trip.resort_options.create!({ resort_id: params[:resort_id] }) if params[:resort_id]
    serialize(trip, status: :created)
  end

  def update
    trip = Trip.update(params[:id], trip_params)
    serialize(trip)
  end

  def destroy
    render json: Trip.destroy(params[:id])
  end

  private

  def trip_params
    params.permit(:name, :start_date, :end_date)
  end
end
