class Api::V1::ResortsController < Api::V1::Resorts::BaseController
  def index
    if params[:states]
      resorts = ResortFacade.resorts_by_state(params[:states])
      render json: StateResortSerializer.new(resorts)
    elsif params[:ids]
      serialize_resorts(find_resorts(params[:ids]))
    end
  end

  def show
    serialize_resorts(find_resorts(params[:id]))
  end
end
