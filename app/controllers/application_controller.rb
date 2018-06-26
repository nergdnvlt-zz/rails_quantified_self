class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid

  protected

  def not_found
    render status: 404
  end

  def invalid
    render status: 404
  end
end
