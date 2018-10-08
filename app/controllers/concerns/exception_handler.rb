module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: true, message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { error: true, message: e.message }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::StatementInvalid do |e|
      render json: { error: true, message: e.message }, status: 422
    end
  end
end