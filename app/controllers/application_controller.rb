class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  protected

  def not_found
    render status: 404
  end
end
