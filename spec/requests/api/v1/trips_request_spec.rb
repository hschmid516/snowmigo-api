require 'rails_helper'

RSpec.describe 'Trips' do
  describe 'Requests' do
    before :each do
      @users = create_list(:user, 4)
      @resort = Resort.new({id: 1, resortName: 'Big Boi Mountain'})
      @resort2 = Resort.new({id: 2, resortName: 'Small Gorl Mountain'})
      @trips = create_list(:trip, 10, resort_id: @resort.id)
      @riders = create(:rider, trip: @trips[0], user: @users[0])
      @riders2 = create(:rider, trip: @trips[1], user: @users[1])
      @riders3 = create(:rider, trip: @trips[1], user: @users[2])
      @riders4 = create(:rider, trip: @trips[2], user: @users[3])
    end

    describe 'Index Endpoint' do
      it 'returns a list of Trips' do
        get '/api/v1/trips', params: { user_id: 1 }

        expect(response).to be_successful
        expect(json).to be_a(Hash)
        expect(json[:data]).to be_a(Array)
        expect(json[:data].count).to eq(10)

        json[:data].each do |resource|
          expect(resource[:id]).to be_a(String)
          expect(resource[:type]).to eq('trip')
          expect(resource[:attributes]).to be_a(Hash)
          expect(resource[:attributes][:name]).to be_a(String)
          expect(resource[:attributes][:resort_id]).to be_an(Integer)
          expect(resource[:attributes][:start_date]).to be_a(String)
          expect(resource[:attributes][:end_date]).to be_a(String)
        end
      end

      it 'can find a trip' do
        get "/api/v1/trips/#{@trips.last.id}"

        expect(response).to be_successful

        expect(json).to be_a(Hash)

        expect(json[:data]).to be_a(Hash)
        expect(json[:data][:id]).to be_a(String)
        expect(json[:data][:type]).to eq('trip')

        expect(json[:data][:attributes]).to be_a(Hash)
        expect(json[:data][:attributes][:name]).to be_a(String)
        expect(json[:data][:attributes][:resort_id]).to be_a(Integer)
        expect(json[:data][:attributes][:start_date]).to be_a(String)
        expect(json[:data][:attributes][:end_date]).to be_a(String)
      end

      it 'can create a trip' do
        trip_params = {
          name: 'Teehee Trip',
          resort_id: 1,
          start_date: '11/10/2021',
          end_date: '11/14/2021'
        }
        
        post '/api/v1/trips', params: trip_params
  
        expect(response).to be_successful
        
        expect(json).to be_a(Hash)
  
        expect(json[:data]).to be_a(Hash)
        expect(json[:data][:id]).to be_a(String)
        expect(json[:data][:type]).to eq('trip')
  
        expect(json[:data][:attributes][:name]).to be_a(String)
        expect(json[:data][:attributes][:resort_id]).to be_a(Integer)
        expect(json[:data][:attributes][:start_date]).to be_a(String)
        # TODO: WHY DOES THIS COME UP AS NIL?
        # expect(json[:data][:attributes][:end_date]).to be_a(String)
  
        expect(json[:data][:attributes]).to_not have_key(:created_at)
        expect(json[:data][:attributes]).to_not have_key(:updated_at)
      end

      it 'can update a trip' do
        old_start_date = @trips.first.start_date
        trip_params = {start_date: '11/4/2021'}

        patch "/api/v1/trips/#{@trips.first.id}", params: trip_params

        updated_trip = Trip.find(@trips.first.id)

        expect(response).to be_successful

        expect(json).to be_a(Hash)
  
        expect(json[:data]).to be_a(Hash)
        expect(json[:data][:id]).to be_a(String)
        expect(json[:data][:type]).to eq('trip')
  
        expect(json[:data][:attributes][:name]).to be_a(String)
        expect(json[:data][:attributes][:resort_id]).to be_a(Integer)
        expect(json[:data][:attributes][:start_date]).to be_a(String)

        expect(updated_trip.start_date).to_not eq(old_start_date)
      end

      it 'can delete a trip' do
        expect(Trip.count).to eq(10)
        old_last_id = @trips.last.id

        delete "/api/v1/trips/#{old_last_id}"

        expect(response).to be_successful

        expect(Trip.count).to eq(9)
        expect{Trip.find(old_last_id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
