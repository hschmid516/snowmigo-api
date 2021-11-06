class Api::V1::TripsController < Api::V1::Trips::BaseController
  before_action only: %i[show update destroy] do
    @trip = set_trip
  end

  def index
    trips = Trip.all
    serialize(trips)
  end

  def show
  end

  def create
    trip = Trip.create(trip_params)
    serialize(trip, :created)
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
    params.permit(:name, :resort_id, :resort_name, :start_date, :end_date)
  end
end
