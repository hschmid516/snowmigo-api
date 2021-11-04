require 'rails_helper'

RSpec.describe 'Trips' do
  describe 'Requests' do
    before :each do
      @user = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
      @trip = create(:trip)
      @trip1 = create(:trip)
      @trips = create_list(:trip, 10)
      @riders = create(:rider, trip: trip, user: user)
      @riders = create(:rider, trip: trip, user: user2)
      @riders = create(:rider, trip: trip1, user: user3)
      @riders = create(:rider, trip: trip1, user: user2)
      @riders = create_list(:rider, 10)
    end

    describe 'Index Endpoint' do
      it 'returns a list of Trips' do
        get '/api/v1/trips', params: { user_id: 1 }
        
        expect(request).to be_successful
      end
    end
  end
end
