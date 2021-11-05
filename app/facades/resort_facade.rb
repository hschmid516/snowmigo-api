class ResortFacade
  class << self
    def resorts_by_state(state)
      resorts = ResortService.resorts_by_state(state)
      resorts.map do |resort_info|
        Resort.new(resort_info)
      end
    end

    def resorts_by_id(ids)
      resorts = ResortService.resorts_by_id(ids)
      resorts.map do |resort_info|
        weather_info = ResortService.weather(resort_info[:resortName], resort_info[:state])
        Resort.new(resort_info, weather_info)
      end
    end
  end
end
