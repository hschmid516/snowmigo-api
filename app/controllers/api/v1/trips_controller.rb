class Api::V1::TripsController < Api::V1::Trips::BaseController
  before_action only: %i[show update destroy] do
    @trip = set_trip
  end

  def index
    trips = Trip.all
    serialize(trips)
  end

  def show
    options = { include: [:resort_options] }
    serialize(@trip, options: options)
  end

  def create
    trip = Trip.create(trip_params)
    serialize(trip, status: :created)
  end

  def update
    trip = Trip.update(params[:id], trip_params)
    serialize(trip)
  end

  def destroy
    render json: Trip.delete(params[:id])
  end

  private

  def trip_params
    params.permit(:name, :resort_id, :resort_name, :start_date, :end_date)
  end
end
