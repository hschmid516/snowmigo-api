class TripSerializer
  include JSONAPI::Serializer

  attributes :name,
             :resort_id,
             :resort_name,
             :start_date,
             :end_date

  has_many :resort_options
end
