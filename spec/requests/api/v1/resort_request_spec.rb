require 'rails_helper'

RSpec.describe 'Resort Requests', :vcr do
  describe 'Index' do
    it 'returns Resorts by state' do
      get '/api/v1/resorts?states=co'

      expect(response).to be_successful

      expect(json).to be_a Hash
      expect(json[:data]).to be_a Array

      json[:data].each do |resort|
        expect(resort[:type]).to eq 'state_resort'
        expect(resort[:id]).to be_a String
        expect(resort[:attributes][:name]).to be_a String
        expect(resort[:attributes]).to_not have_key :created_at
        expect(resort[:attributes]).to_not have_key :updated_at
      end
    end
  end
end
