require 'rails_helper'

RSpec.describe ResortOption, type: :model do
  describe 'relationships' do
    it { should belong_to(:trip) }
  end
  describe 'instance methods' do
    before(:each) do
      @users = create_list(:user, 4)
      @trips = create_list(:trip, 2)
      @resort1 = Resort.new({id: 1, resortName: 'A-Basin'})
      @resort2 = Resort.new({id: 2, resortName: 'Eldora'})
      @resort_option1 = create(:resort_option, trip: @trips.first, resort_id: @resort1.id)
      @resort_option2 = create(:resort_option, trip: @trips.first, resort_id: @resort2.id)
      @resort_option3 = create(:resort_option, trip: @trips.last, resort_id: @resort1.id)
      @resort_option4 = create(:resort_option, trip: @trips.last, resort_id: @resort2.id)
      @rider1 = create(:rider, trip: @trips.first, user: @users[0], vote: @resort1.id)
      @rider2 = create(:rider, trip: @trips.first, user: @users[1], vote: @resort2.id)
      @rider3 = create(:rider, trip: @trips.first, user: @users[2], vote: @resort2.id)
      @rider4 = create(:rider, trip: @trips.last, user: @users[3], vote: @resort1.id)
      @rider5 = create(:rider, trip: @trips.last, user: @users[2], vote: @resort1.id)
      @rider6 = create(:rider, trip: @trips.last, user: @users[1], vote: @resort1.id)
    end
    it '#counted_votes' do
      expect(@resort_option1.counted_votes).to eq(1)
      expect(@resort_option2.counted_votes).to eq(2)
      expect(@resort_option3.counted_votes).to eq(3)
      expect(@resort_option4.counted_votes).to eq(0)
    end
  end
end
