class TripSerializer
  include JSONAPI::Serializer
  attributes :name, :resort_id, :start_date, :end_date
end
