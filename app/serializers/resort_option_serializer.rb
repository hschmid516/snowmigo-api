class ResortOptionSerializer
  include JSONAPI::Serializer

  attributes :trip_id, :resort_id, :resort_name, :vote_count
end
