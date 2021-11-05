class Api::V1::ResortsController < ApplicationController
  def index
    if params[:states]
      resorts = ResortFacade.resorts_by_state(params[:states])
      render json: StateResortSerializer.new(resorts)
    elsif params[:ids]
      resorts = ResortFacade.resorts_by_id(params[:ids])
      render json: ResortSerializer.new(resorts)
    end
  end

  def show
    resorts = ResortFacade.resorts_by_id(params[:id])
    render json: ResortSerializer.new(resorts)
  end
end
