require 'rails_helper'

describe 'riders' do
  describe 'happy paths' do
    describe 'creating riders' do
      let(:user) { create(:user)}
      let(:trip) { create(:trip)}

      it 'can create riders' do
        rider_params = {
          trip_id: trip.id,
          user_id: user.id,
          email: user.email,
          driver: false,
          budget: 300
        }
        post "/api/v1/riders", params: rider_params
        rider = Rider.last

        expect(response).to have_http_status(:created)
        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:id]).to be_a String
        expect(json[:data][:type]).to eq 'rider'
        expect(json[:data][:attributes]).to be_a(Hash)
        expect(json[:data][:attributes][:user_id]).to be_a(Integer)
        expect(json[:data][:attributes][:trip_id]).to be_a(Integer)
        expect(json[:data][:attributes][:host]).to be_a(FalseClass)
        expect(json[:data][:attributes][:driver]).to be_a(FalseClass)
        expect(json[:data][:attributes][:budget]).to be_an(Integer)
        expect(rider.trip_id).to eq(rider_params[:trip_id])
        expect(rider.user_id).to eq(user.id)
        expect(rider.driver).to eq(false)
        expect(rider.budget).to eq(300)
      end
    end
  end

  describe 'sad paths' do
    before(:each) do
      @trip = create(:trip)
      @user = create(:user)
    end

    it '400 if no trip found' do
      rider_params = {
        trip_id: 75679678,
        user_id: @user.id,
        email: @user.email,
        driver: false,
        budget: 300
      }
      post "/api/v1/riders", params: rider_params

      expect(response.status).to eq(400)
    end

    it '404 if no user found' do
      rider_params = {
        trip_id: @trip.id,
        email: 'thisemailisfake@woo.com',
        driver: false,
        budget: 300
      }
      post "/api/v1/riders", params: rider_params

      expect(response.status).to eq(404)
    end

    it '404 if no trip or no user provided' do
      rider_params = {
        driver: false,
        budget: 300
      }
      post "/api/v1/riders", params: rider_params

      expect(response.status).to eq(404)
    end
  end
end
