class RiderSerializer
  include JSONAPI::Serializer

  attributes :user_id, :trip_id, :host, :driver, :budget, :rider_name, :vote
end
