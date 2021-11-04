require 'rails_helper'

RSpec.describe "Trips", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/trips/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/trips/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/trips/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/trips/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/trips/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
