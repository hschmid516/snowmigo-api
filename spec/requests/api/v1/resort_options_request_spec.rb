require 'rails_helper'

describe 'resort options' do
  describe 'happy paths' do
    describe 'creating resort options' do
      let(:trip) { create(:trip)}
      let(:resort) { create(:user)}

      it 'can create resort_options' do
        option_params = {
          trip_id: trip.id,
          resort_id: resort.id,
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
        expect(option.vote_count).to eq(0)
        expect(option.resort_name).to eq('Copper')
      end
    end
  end

  describe 'sad paths' do
    before(:each) do
      @trip = create(:trip)
      @resort1 = Resort.new({id: 1, resortName: 'A-Basin'})
    end
    it '400 if no trip found' do
      option_params = {
        trip_id: 78698475205,
        resort_id: @resort1.id,
        resort_name: 'A-Basin'
      }
      post "/api/v1/resort_options", params: { resort_option: option_params}
      expect(response.status).to eq(400)
    end

    it '400 if resort_id incorrect' do
      option_params = {
        trip_id: @trip.id,
        resort_id: 'djsfklghj',
        resort_name: 'A-Basin'
      }
      post "/api/v1/resort_options", params: { resort_option: option_params}
      expect(response.status).to eq(400)
    end

    it '400 if incomplete params' do
      option_params = {
        trip_id: @trip.id,
        resort_name: 'A-Basin'
      }
      post "/api/v1/resort_options", params: { resort_option: option_params}
      expect(response.status).to eq(400)

      option_params_2 = {
        resort_id: @resort1.id,
        resort_name: 'A-Basin'
      }
      post "/api/v1/resort_options", params: { resort_option: option_params_2}
      expect(response.status).to eq(400)
    end
  end
end
