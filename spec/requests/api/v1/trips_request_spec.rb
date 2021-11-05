require 'rails_helper'

RSpec.describe 'Trips' do
  describe 'Requests' do
    before :each do
      @user = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
      @resort = Resort.new({id: 1, resortName: 'Big Boi Mountain'})
      @resort2 = Resort.new({id: 2, resortName: 'Small Gorl Mountain'})
      # @trip = create(:trip, resort_id: @resort.id)
      # @trip1 = create(:trip, resort_id: @resort2.id)
      @trips = create_list(:trip, 10, resort_id: @resort.id)
      @riders = create(:rider, trip: @trips[0], user: @user)
      @riders2 = create(:rider, trip: @trips[1], user: @user2)
      @riders3 = create(:rider, trip: @trips[1], user: @user3)
      @riders4 = create(:rider, trip: @trips[2], user: @user2)
      # @riders5 = create_list(:rider, 10)
    end

    describe 'Index Endpoint' do
      it 'returns a list of Trips' do
        get '/api/v1/trips', params: { user_id: 1 }

        expect(response).to be_successful

        expect(json).to be_a(Hash)

        expect(json[:data]).to be_a(Array)
        # expect(json[:data].count).to eq(10)
        
        json[:data] do |resource|
          expect(resource[:id]).to be_a(String)
          expect(resource[:type]).to eq('trip')
          expect(resource[:attributes]).to be_a(Hash)
          expect(resourse[:attributes][:resort_id]).to be_a(String)
          expect(resourse[:attributes][:start_date]).to be_a(String)
          expect(resourse[:attributes][:end_date]).to be_a(String)
        end
      end
    end
  end
end
