class RiderSerializer
  include JSONAPI::Serializer

  attributes :user_id, :trip_id, :host, :driver, :budget, :rider_name

  # attribute :name do |rider|
  #   rider.name
  # end
end
