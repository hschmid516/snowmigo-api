require 'rails_helper'

RSpec.describe Rider, type: :model do
  describe 'relationships' do
    it { should belong_to(:trip) }
    it { should belong_to(:user) }
  end

  describe 'class methods' do
    it '#by_trip_and_user' do
      trips = create_list(:trip, 2)
      users = create_list(:user, 2)
      rider = create(:rider, trip: trips[0], user: users[1])

      expect(Rider.by_trip_and_user(users[1].id, trips[0].id)).to eq(rider)
    end
  end
end
