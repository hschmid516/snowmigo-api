require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:friend).class_name('User') }

  describe 'instance methods' do
    it '#friend_name' do
      user = create_list(:user, 2)
      friendship = create(:friendship, user: user[0], friend: user[1])
      expect(friendship.friend_name).to eq(user[1].name)
    end
  end
end
