class Api::V1::ResortsController < ApplicationController
  def index
    resorts = ResortFacade.get_resorts_by_state(params[:states])
    render json: StateResortSerializer.new(resorts)
  end
end
