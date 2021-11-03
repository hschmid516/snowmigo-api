require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'Setup' do
    let(:users) { create_list(:user, 10) }

    # describe "GET /index" do
    #   it "returns http success" do
    #     get "/api/v1/"
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    describe "GET /show" do
      it "returns http success" do
        get "/api/v1/users/#{users.first.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /create" do
      xit "returns http success" do
        post "/api/v1/users"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /update" do
      xit "returns http success" do
        patch "/api/v1/users/#{users.first.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /destroy" do
      xit "returns http success" do
        delete "/api/v1/users/#{users.first.id}"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
