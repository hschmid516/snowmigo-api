class RiderSerializer
  include JSONAPI::Serializer

  attributes :user_id, :trip_id, :host, :driver, :budget
  belongs_to :trip
end
