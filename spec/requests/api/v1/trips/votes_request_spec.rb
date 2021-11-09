require 'rails_helper'

RSpec.describe 'trips vote request' do
  before(:each) do
    @users = create_list(:user, 4)
    @trips = create_list(:trip, 2)
    @resort1 = Resort.new({id: 1, resortName: 'A-Basin'})
    @resort2 = Resort.new({id: 2, resortName: 'Eldora'})
    @resort_option1 = create(:resort_option, trip: @trips.first, resort_id: @resort1.id)
    @resort_option2 = create(:resort_option, trip: @trips.first, resort_id: @resort2.id)
    @resort_option3 = create(:resort_option, trip: @trips.last, resort_id: @resort1.id)
    @resort_option4 = create(:resort_option, trip: @trips.last, resort_id: @resort2.id)
    @rider1 = create(:rider, trip: @trips.first, user: @users[0])
    @rider2 = create(:rider, trip: @trips.first, user: @users[1])
    @rider3 = create(:rider, trip: @trips.first, user: @users[2])
    @rider4 = create(:rider, trip: @trips.last, user: @users[3])
    @rider5 = create(:rider, trip: @trips.last, user: @users[2])
    @rider6 = create(:rider, trip: @trips.last, user: @users[1])
  end
  describe 'happy paths' do
    it 'updates rider vote and resort option vote count' do
      rider = Rider.by_user_and_trip(@users[0].id, @trips.first.id)
      expect(rider.vote).to be(nil)
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[0].id}&resort_id=#{@resort1.id}"

      expect(response).to be_successful
      rider_voted = Rider.by_user_and_trip(@users[0].id, @trips.first.id)
      expect(rider_voted.vote).to eq(@resort1.id)
    end
  end
  describe 'sad paths' do
    it 'returns 400 if incorrect params' do
      patch "/api/v1/trips/#{@trips.first.id}/vote?resort_id=#{@resort1.id}"
      expect(response.status).to eq(400)

      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[0].id}"
      expect(response.status).to eq(400)

      patch "/api/v1/trips/#{@trips.first.id}/vote"
      expect(response.status).to eq(400)
    end
  end
end
