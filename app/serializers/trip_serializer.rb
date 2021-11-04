class TripSerializer
  include JSONAPI::Serializer
  attributes :resort_id, :start_date, :end_date
end
