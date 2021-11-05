require 'rails_helper'

RSpec.describe 'Resort Poro' do
  describe 'Poro & attributes' do
    it 'is a resort' do
      resort = Resort.new(resort_info)

      expect(resort).to be_a Resort
      expect(resort.name).to eq('Arapahoe Basin')
      expect(resort.id).to eq('303001')
    end
  end
end
