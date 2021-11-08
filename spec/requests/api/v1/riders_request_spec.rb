require 'rails_helper'

describe 'riders' do
  describe 'creating riders' do
    let(:user) { create(:user)}
    let(:trip) { create(:trip)}

    it 'can create riders' do
      rider_params = {
        trip_id: trip.id,
        user_id: user.id,
        host: true,
        driver: false,
        budget: 300
      }
      post "/api/v1/riders", params: { rider: rider_params }
      rider = Rider.last

      expect(response).to have_http_status(:created)
      expect(json).to be_a Hash
      expect(json[:data]).to be_a Hash
      expect(json[:data][:id]).to be_a String
      expect(json[:data][:type]).to eq 'rider'
      expect(rider.trip_id).to eq(rider_params[:trip_id])
      expect(rider.user_id).to eq(rider_params[:user_id])
      expect(rider.host).to eq(true)
      expect(rider.driver).to eq(false)
      expect(rider.budget).to eq(300)
    end
  end
end
