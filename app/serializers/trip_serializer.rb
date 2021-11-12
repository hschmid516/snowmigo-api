class TripSerializer
  include JSONAPI::Serializer

  attributes :name,
             :resort_id,
             :resort_name,
             :start_date,
             :end_date,
             :vote_status

  attribute :riders do |trip|
    trip.riders.map do |rider|
      RiderSerializer.new(rider)
    end
  end

  attribute :resort_options do |trip|
    trip.resort_options.map do |resort_opt|
      ResortOptionSerializer.new(resort_opt)
    end
  end
end
