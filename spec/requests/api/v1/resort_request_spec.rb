require 'rails_helper'

RSpec.describe 'Resort Requests', :vcr do
  describe 'Index' do
    it 'returns Resorts by state' do
      get '/api/v1/resorts?states=co'

      expect(response).to be_successful
      expect(json).to be_a Hash
      expect(json[:data]).to be_an Array

      json[:data].each do |resort|
        expect(resort[:type]).to eq 'state_resort'
        expect(resort[:id]).to be_a String
        expect(resort[:attributes][:name]).to be_a String
        expect(resort[:attributes]).to_not have_key :created_at
        expect(resort[:attributes]).to_not have_key :updated_at
      end
    end

    it 'can return multiple resorts by id' do
      get '/api/v1/resorts?ids=303005,303001'

      expect(response).to be_successful
      expect(json).to be_a Hash
      expect(json[:data]).to be_an Array
      expect(json[:data].length).to eq(2)

      json[:data].each do |resort|
        expect(resort[:type]).to eq 'resort'
        expect(resort[:id]).to be_a String
        expect(resort[:attributes][:name]).to be_a String
        expect(resort[:attributes]).to_not have_key :created_at
        expect(resort[:attributes]).to_not have_key :updated_at
      end
    end
  end

  describe 'Show' do
    it 'returns Resorts by state' do
      get '/api/v1/resorts/303005'

      expect(response).to be_successful
      expect(json).to be_a Hash
      expect(json.first).to be_an Array
      expect(json[:data]).to be_an Array
      expect(json[:data].first[:type]).to eq 'resort'
      expect(json[:data].first[:id]).to be_a String
      expect(json[:data].first[:attributes][:name]).to be_a String
      expect(json[:data].first[:attributes]).to_not have_key :created_at
      expect(json[:data].first[:attributes]).to_not have_key :updated_at
    end
  end
end
