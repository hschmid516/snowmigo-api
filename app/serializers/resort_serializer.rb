class ResortSerializer
  include JSONAPI::Serializer
  attributes :name,
             :new_snow,
             :base_depth,
             :open_trails,
             :open_lifts,
             :snow_condition,
             :mask_required,
             :trail_map,
             :logo,
             :chance_of_snow,
             :hourly_weather
end
