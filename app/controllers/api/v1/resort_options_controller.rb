class Api::V1::ResortOptionsController < ApplicationController
  def create
    resort_option = ResortOption.create!(resort_option_params)

    render json: ResortOptionSerializer.new(resort_option), status: :created
  end

  private

  def resort_option_params
    params.require(:resort_option)
          .permit(:trip_id, :resort_id, :vote_count, :resort_name)
  end
end
