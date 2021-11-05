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
  end

  def update
  end

  def destroy
  end
end
