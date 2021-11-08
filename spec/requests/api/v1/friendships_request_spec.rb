require 'rails_helper'

describe 'friendships' do
  describe 'adding friends' do
    let(:user1) { create(:user)}
    let(:user2) { create(:user)}

    it 'can create a friendship' do
      friendship_params = { user_id: user1.id, friend_id: user2.id}
      
      post "/api/v1/friendships", params: { friendship: friendship_params}
      friendship = Friendship.last

      expect(response).to have_http_status(:created)
      expect(json).to be_a Hash
      expect(json[:data]).to be_a Hash
      expect(json[:data][:id]).to be_a String
      expect(json[:data][:type]).to eq('friendship')
      expect(friendship.user_id).to eq(user1.id)
      expect(friendship.friend_id).to eq(user2.id)
    end
  end
end
