require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it { should have_many(:resort_options) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe 'instance methods' do
    before(:each) do
      @users = create_list(:user, 4)
      @trips = create_list(:trip, 3)
      @resort1 = Resort.new({id: 1, resortName: 'A-Basin'})
      @resort2 = Resort.new({id: 2, resortName: 'Eldora'})
      @resort_option1 = create(:resort_option, trip: @trips.first, resort_id: @resort1.id)
      @resort_option2 = create(:resort_option, trip: @trips.first, resort_id: @resort2.id)
      @resort_option3 = create(:resort_option, trip: @trips.last, resort_id: @resort1.id)
      @resort_option4 = create(:resort_option, trip: @trips.last, resort_id: @resort2.id)
      @resort_option5 = create(:resort_option, trip: @trips[1], resort_id: @resort1.id, created_at: '2021-11-11')
      @resort_option6 = create(:resort_option, trip: @trips[1], resort_id: @resort2.id, created_at: '2021-10-10')
      @rider1 = create(:rider, trip: @trips.first, user: @users[0], vote: @resort1.id)
      @rider2 = create(:rider, trip: @trips.first, user: @users[1], vote: @resort2.id)
      @rider3 = create(:rider, trip: @trips.first, user: @users[2], vote: @resort2.id)
      @rider4 = create(:rider, trip: @trips.last, user: @users[3], vote: @resort1.id)
      @rider5 = create(:rider, trip: @trips.last, user: @users[2], vote: @resort1.id)
      @rider6 = create(:rider, trip: @trips.last, user: @users[1], vote: @resort1.id)
      @rider7 = create(:rider, trip: @trips[1], user: @users[0], vote: @resort1.id)
      @rider8 = create(:rider, trip: @trips[1], user: @users[1], vote: @resort1.id)
      @rider9 = create(:rider, trip: @trips[1], user: @users[2], vote: @resort2.id)
      @rider10 = create(:rider, trip: @trips[1], user: @users[3], vote: @resort2.id)
    end

    it '#update_resort_votes' do
      expect(@resort_option1.vote_count).to eq(0)
      expect(@resort_option2.vote_count).to eq(0)
      expect(@resort_option3.vote_count).to eq(0)
      expect(@resort_option4.vote_count).to eq(0)

      @trips.first.update_resort_votes
      resort_options = @trips.first.resort_options

      expect(resort_options[0].id).to eq(@resort_option1.id)
      expect(resort_options[1].id).to eq(@resort_option2.id)
      expect(resort_options[0].vote_count).to eq(1)
      expect(resort_options[1].vote_count).to eq(2)

      @trips.last.update_resort_votes
      resort_options_2 = @trips.last.resort_options

      expect(resort_options_2[0].id).to eq(@resort_option3.id)
      expect(resort_options_2[1].id).to eq(@resort_option4.id)
      expect(resort_options_2[0].vote_count).to eq(3)
      expect(resort_options_2[1].vote_count).to eq(0)
    end

    it '#max_vote_resort' do
      @trips.first.update_resort_votes
      resort_options = @trips.first.resort_options
      @trips.last.update_resort_votes
      resort_options2 = @trips.last.resort_options

      expect(@trips.first.max_vote_resort).to eq(resort_options[1].resort_id)
      expect(@trips.last.max_vote_resort).to eq(resort_options2[0].resort_id)
    end

    it 'returns the resort option created first if vote count is equal' do
      @trips[1].update_resort_votes
      resort_options = @trips[1].resort_options
      expect(@trips[1].max_vote_resort).to eq(resort_options[1].resort_id)
    end
  end
end
