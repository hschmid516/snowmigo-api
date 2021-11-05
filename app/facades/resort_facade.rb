class ResortFacade
  def self.get_resorts_by_state(state)
    resorts = ResortService.get_resorts_by_state(state)
    resorts.map do |resort_info|
      Resort.new(resort_info)
    end
  end
end
