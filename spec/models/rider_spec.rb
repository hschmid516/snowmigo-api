require 'rails_helper'

RSpec.describe Rider, type: :model do
  describe 'relationships' do
    it { should belong_to(:trip) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:budget) }
  end

  describe 'class methods' do
    it '#by_trip_and_user' do
      trips = create_list(:trip, 2)
      users = create_list(:user, 2)
      rider = create(:rider, trip: trips[0], user: users[1])

      expect(Rider.by_user_and_trip(users[1].id, trips[0].id)).to eq(rider)
    end
  end

  describe 'instance methods' do
    it '#rider_name' do
      trips = create_list(:trip, 2)
      users = create_list(:user, 2)
      rider = create(:rider, trip: trips[0], user: users[1])
      expect(rider.rider_name).to eq(users[1].name)
    end
  end
end
