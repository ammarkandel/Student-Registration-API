class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  before_action :authenticate_and_set_student

  def jsonapi_class
    Hash.new { |h, k| h[k] = "Api::V1::#{k}Serializer".safe_constantize }
  end

  def responds_with_errors(errors, status)
    render jsonapi_errors: errors, status: status
  end

  def responds_with_resource(resource, status: 200, meta: nil)
    render jsonapi: resource, status: status, meta: meta
  end

  def render_not_found_response(exception)
    render json: { message: exception.message, code: 'not_found' }, status: :not_found
  end
end
