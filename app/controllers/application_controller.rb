class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request
  rescue_from ActiveRecord::StatementInvalid, with: :bad_request

  private

  def bad_request
    render json: { error: "400 Bad Request" }, status: 400
  end

  def record_not_found
   render json: { error: "404 Not Found" }, status: 404
  end
end
