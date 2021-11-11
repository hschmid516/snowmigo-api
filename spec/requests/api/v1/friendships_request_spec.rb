require 'rails_helper'

describe 'friendships' do
  describe 'adding friends' do
    describe 'happy paths' do
      let(:user1) { create(:user)}
      let(:user2) { create(:user)}

      it 'can create a friendship' do
        post "/api/v1/friendships?user_id=#{user1.id}&email=#{user2.email}"
        friendship = Friendship.last

        expect(response).to have_http_status(:created)
        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:id]).to be_a String
        expect(json[:data][:type]).to eq('friendship')
        expect(json[:data][:attributes]).to be_a(Hash)
        expect(json[:data][:attributes][:user_id]).to be_an(Integer)
        expect(json[:data][:attributes][:friend_id]).to be_an(Integer)
        expect(json[:data][:attributes][:friend_name]).to be_a(String)

        expect(friendship.user_id).to eq(user1.id)
        expect(friendship.friend_id).to eq(user2.id)
        expect(json[:data][:attributes][:friend_name]).to eq(user2.name)
      end
    end
    describe 'sad paths' do
      before(:each) do
        @user1 = create(:user)
        @user2 = create(:user)
      end
      it '404 when user does not exist for friend' do
        post "/api/v1/friendships?user_id=#{@user1.id}&email=notarealemail@literallynot.com"
        expect(response.status).to eq(404)
      end

      it '404 when user does not exit for user' do
        post "/api/v1/friendships?user_id=9988686823435&#{@user1.email}"
        expect(response.status).to eq(404)
      end

      it '400 if duplicate friend' do
        create(:friendship, user: @user1, friend: @user2)
        post "/api/v1/friendships?user_id=#{@user1.id}&email=#{@user2.email}"
        expect(response.status).to eq(400)
      end

      it '400 if user adds self' do
        post "/api/v1/friendships?user_id=#{@user1.id}&email=#{@user1.email}"
        expect(response.status).to eq(400)
      end
    end
  end
end
