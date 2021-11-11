require 'rails_helper'

RSpec.describe 'Trips' do
  describe 'Requests' do
    before :each do
      @users = create_list(:user, 4)
      @resort = Resort.new({id: 1, resortName: 'Big Gorl Mountain'})
      @resort2 = Resort.new({id: 2, resortName: 'Small Boi Mountain'})
      @trips = create_list(:trip, 10, resort_id: @resort.id)
      @riders = create(:rider, trip: @trips[0], user: @users[0])
      @riders2 = create(:rider, trip: @trips[1], user: @users[1])
      @riders3 = create(:rider, trip: @trips[1], user: @users[2])
      @riders4 = create(:rider, trip: @trips[2], user: @users[3])
      @riders5 = create(:rider, trip: @trips[9], user: @users[3])
      @resort_option = create(:resort_option, trip: @trips.last, resort_id: @resort.id, resort_name: "Arapahoe Basin")
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
          expect(resource[:attributes][:vote_status]).to be_a(String)
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
        expect(json[:data][:attributes][:vote_status]).to be_a(String)

        expect(json[:data][:attributes][:riders]).to be_an(Array)
        expect(json[:data][:attributes][:riders].first).to be_an(Hash)
        expect(json[:data][:attributes][:riders].first[:data][:id]).to be_an(String)
        expect(json[:data][:attributes][:riders].first[:data][:type]).to be_an(String)
        expect(json[:data][:attributes][:riders].first[:data][:attributes]).to be_a(Hash)

        rider_attr = json[:data][:attributes][:riders].first[:data][:attributes]
        expect(rider_attr[:rider_name]).to be_a(String)
        expect(rider_attr[:trip_id]).to be_a(Integer)
        expect(rider_attr[:user_id]).to be_a(Integer)
        expect(rider_attr[:budget]).to be_a(Integer)
        expect(rider_attr[:host]).to be_a(FalseClass)
        expect(rider_attr[:driver]).to be_a(FalseClass)


        expect(json[:data][:attributes][:resort_options]).to be_an(Array)
        expect(json[:data][:attributes][:resort_options].first).to be_an(Hash)
        expect(json[:data][:attributes][:resort_options].first[:data]).to be_an(Hash)

        resort_option_attr = json[:data][:attributes][:resort_options].first[:data][:attributes]
        expect(resort_option_attr[:trip_id]).to be_an(Integer)
        expect(resort_option_attr[:resort_id]).to be_an(Integer)
        expect(resort_option_attr[:resort_name]).to be_an(String)
        expect(resort_option_attr[:vote_count]).to be_an(Integer)
      end

      it 'returns an empty array without riders' do
        get "/api/v1/trips/#{@trips[8].id}"
        expect(response).to be_successful

        expect(json[:data][:attributes][:riders]).to be_an(Array)
        expect(json[:data][:attributes][:riders].empty?).to eq(true)
      end

      it 'can create a trip and hosting rider without a resort' do
        trip_params = {
          user_id: @users[0].id,
          name: 'Teehee Trip',
          start_date: '10-11-2021',
          end_date: '14-11-2021'
        }

        post '/api/v1/trips', params: trip_params
        expect(response).to be_successful

        expect(json).to be_a(Hash)
        expect(json[:data]).to be_a(Hash)
        expect(json[:data][:id]).to be_a(String)
        expect(json[:data][:type]).to eq('trip')
        expect(json[:data][:attributes][:name]).to be_a(String)
        expect(json[:data][:attributes][:start_date]).to be_a(String)
        expect(json[:data][:attributes][:end_date]).to be_a(String)
        expect(json[:data][:attributes][:vote_status]).to be_a(String)
        expect(json[:data][:attributes][:resort_options].empty?).to eq(true)
        expect(json[:data][:attributes][:riders].first[:data][:attributes][:user_id]).to eq(@users[0].id)
        expect(json[:data][:attributes][:riders].first[:data][:attributes][:host]).to be_a(TrueClass)

        expect(json[:data][:attributes]).to_not have_key(:created_at)
        expect(json[:data][:attributes]).to_not have_key(:updated_at)
      end

      it 'can create a trip and hosting rider with a resort' do
        trip_params = {
          user_id: @users[0].id,
          name: 'Resort Trip',
          start_date: '10-11-2021',
          resort_id: 1,
          end_date: '14-11-2021'
        }

        post '/api/v1/trips', params: trip_params
        expect(response).to be_successful
        expect(json[:data][:attributes][:resort_options].first[:data][:attributes][:resort_id]).to eq(1)
        expect(json[:data][:attributes][:riders].first[:data][:attributes][:user_id]).to eq(@users[0].id)
        expect(json[:data][:attributes][:riders].first[:data][:attributes][:host]).to be_a(TrueClass)
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
  describe 'sad paths' do
    before(:each) do
      @user = create(:user)
    end
    context 'create' do
      it '400 if no user found' do
        trip_params = {
          user_id: 0734750,
          name: 'Resort Trip',
          start_date: '10-11-2021',
          resort_id: 1,
          end_date: '14-11-2021'
        }

        post '/api/v1/trips', params: trip_params

        expect(response.status).to eq(400)
      end
      it '400 if no end_date' do
        trip_params = {
          user_id: @user.id,
          name: 'Resort Trip',
          start_date: '10-11-2021',
          resort_id: 1
        }

        post '/api/v1/trips', params: trip_params

        expect(response.status).to eq(400)
      end
      it '400 if no start_date' do
        trip_params = {
          user_id: 0734750,
          name: 'Resort Trip',
          resort_id: 1,
          end_date: '14-11-2021'
        }

        post '/api/v1/trips', params: trip_params

        expect(response.status).to eq(400)
      end
      it '400 if no trip name' do
        trip_params = {
          user_id: 0734750,
          start_date: '10-11-2021',
          resort_id: 1,
          end_date: '14-11-2021'
        }

        post '/api/v1/trips', params: trip_params

        expect(response.status).to eq(400)
      end
    end
  end
end
