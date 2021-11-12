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
      expect(json[:data]).to be_a(String)
      expect(json[:data]).to eq('Vote successfully updated!')
    end

    it 'closes the vote' do
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[0].id}&resort_id=#{@resort1.id}"
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[1].id}&resort_id=#{@resort1.id}"
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[2].id}&resort_id=#{@resort2.id}"
      patch "/api/v1/trips/#{@trips.first.id}/vote_status?open=false"

      expect(response).to be_successful

      expect(json[:data][:attributes][:resort_id]).to be_an(Integer)
      expect(json[:data][:attributes][:resort_id]).to eq(@resort1.id)
      expect(json[:data][:attributes][:vote_status]).to be_a(String)
      expect(json[:data][:attributes][:vote_status]).to eq('closed')
      expect(json[:data][:attributes][:resort_options]).to be_an(Array)
      expect(json[:data][:attributes][:resort_options].empty?).to eq(true)
    end

    it 're-opens the vote' do
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[0].id}&resort_id=#{@resort1.id}"
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[1].id}&resort_id=#{@resort1.id}"
      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[2].id}&resort_id=#{@resort2.id}"
      patch "/api/v1/trips/#{@trips.first.id}/vote_status?open=false"
      patch "/api/v1/trips/#{@trips.first.id}/vote_status?open=true"

      expect(response).to be_successful

      expect(json[:data][:attributes][:resort_id]).to be(nil)
      expect(json[:data][:attributes][:vote_status]).to be_a(String)
      expect(json[:data][:attributes][:vote_status]).to eq('open')
      expect(json[:data][:attributes][:resort_options]).to be_an(Array)
      expect(json[:data][:attributes][:resort_options].count).to eq(1)
      expect(json[:data][:attributes][:resort_options].first[:data][:attributes][:resort_id]).to eq(@resort1.id)
    end
  end

  describe 'sad paths' do
    it 'vote returns 400 if incorrect params' do
      patch "/api/v1/trips/#{@trips.first.id}/vote?resort_id=#{@resort1.id}"
      expect(response.status).to eq(400)

      patch "/api/v1/trips/#{@trips.first.id}/vote?user_id=#{@users[0].id}"
      expect(response.status).to eq(400)

      patch "/api/v1/trips/#{@trips.first.id}/vote"
      expect(response.status).to eq(400)
    end

    it 'vote_status returns 400 if incorrect params' do
      patch "/api/v1/trips/#{@trips.first.id}/vote_status?open=kjldsfhgdjsfh"
      expect(response.status).to eq(400)

      patch "/api/v1/trips/#{@trips.first.id}/vote_status"
      expect(response.status).to eq(400)
    end
  end
end
