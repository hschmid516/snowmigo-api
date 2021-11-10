class TripSerializer
  include JSONAPI::Serializer

  attributes :name,
             :resort_id,
             :resort_name,
             :start_date,
             :end_date,
             :vote_status

  has_many :resort_options
  has_many :riders
end
