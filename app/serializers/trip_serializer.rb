class TripSerializer
  include JSONAPI::Serializer

  attributes :name,
             :resort_id,
             :resort_name,
             :start_date,
             :end_date,
             :vote_status

  attribute :riders do |trip|
    trip.riders
  end

  attribute :resort_options do |trip|
    trip.resort_options
  end
end
