class ResortOptionSerializer
  include JSONAPI::Serializer

  attributes :trip_id, :resort_id, :resort_name, :vote_count
  belongs_to :trip
end
