require 'rails_helper'

RSpec.describe ResortService, :vcr do
  it 'returns resort data' do
    resort = ResortService.get_resorts_by_state('co')

    expect(resort).to be_an Array
    expect(resort.size).to eq(35)
    expect(resort.first).to be_a Hash

    resort.each do |r|
      expect(r[:id]).to be_a String
      expect(r[:resortName]).to be_a String
      expect(r[:state]).to eq('CO')
    end
  end
end
