class TripsFacade
  class << self
    def find_rider_trips(user_id)
      rider_trips = TripsService.get_rider_trips(user_id)
    end
  end
end
