class Api::V1::Resorts::BaseController < ApplicationController
  private

  def serialize_resorts(resorts)
    render json: ResortSerializer.new(resorts)
  end

  def find_resorts(ids)
    ResortFacade.resorts_by_id(ids)
  end
end
