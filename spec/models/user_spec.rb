require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:trips) }
    it { should have_many(:friends).class_name('User') }
    it { should have_many(:friends).through(:friendships) }
  end
  describe 'instance methods' do
    before(:each) do
      @users = create_list(:user, 3)
      create(:friendship, user: @users[0], friend: @users[1])
    end
    it '#current_friend' do
      expect(@users[0].current_friend(@users[1])).to eq(true)
      expect(@users[1].current_friend(@users[0])).to eq(false)
      expect(@users[0].current_friend(@users[2])).to eq(false)
    end
  end
end
