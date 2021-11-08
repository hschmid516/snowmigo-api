require 'rails_helper'

describe 'resort options' do
  describe 'creating resort options' do
    let(:trip) { create(:trip)}
    let(:resort) { create(:user)}

    it 'can create resort_options' do
      option_params = {
        trip_id: trip.id,
        resort_id: resort.id,
        vote_count: 1,
        resort_name: 'Copper'
      }
      post "/api/v1/resort_options", params: { resort_option: option_params}
      option = ResortOption.last

      expect(response).to have_http_status(:created)
      expect(json).to be_a Hash
      expect(json[:data]).to be_a Hash
      expect(json[:data][:id]).to be_a String
      expect(json[:data][:type]).to eq 'resort_option'
      expect(option.trip_id).to eq(option_params[:trip_id])
      expect(option.resort_id).to eq(option_params[:resort_id])
      expect(option.vote_count).to eq(1)
      expect(option.resort_name).to eq('Copper')
    end
  end
end
