require 'rails_helper'

RSpec.describe ResortService, :vcr do
  it 'returns resort data' do
    resorts = ResortService.resorts_by_state('co')

    expect(resorts).to be_an Array
    expect(resorts.size).to eq(35)
    expect(resorts.first).to be_a Hash

    resorts.each do |resort|
      expect(resort[:id]).to be_a String
      expect(resort[:resortName]).to be_a String
      expect(resort[:state]).to eq('CO')
    end
  end

  it 'returns resort data with weather info' do
    resorts = ResortService.resorts_by_id(303005)

    expect(resorts).to be_an Array
    expect(resorts.size).to eq(1)
    expect(resorts.first).to be_a Hash

    resorts.each do |resort|
      expect(resort[:id]).to be_a String
      expect(resort[:resortName]).to be_a String
      expect(resort[:newSnowMin]).to be_a String
      expect(resort[:avgBaseDepthMin]).to be_a String
      expect(resort[:openDownHillTrails]).to be_a String
      expect(resort[:maxOpenDownHillTrails]).to be_a String
      expect(resort[:openDownHillLifts]).to be_a String
      expect(resort[:maxOpenDownHillLifts]).to be_a String
      expect(resort[:primarySurfaceCondition]).to be_a String
      expect(resort[:covidMaskRequired]).to be_a String
      expect(resort[:lgTrailMapURL]).to be_a String
      expect(resort[:logo]).to be_a String
    end
  end
end
