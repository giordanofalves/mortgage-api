# frozen_string_literal: true

# All api Exception should be mapped here
module ExceptionHandler
  extend ActiveSupport::Concern
  include Response

  included do
    rescue_from StandardError do |e|
      notify_error(e, e.message, :internal_server_error)
    end

    rescue_from NoMethodError do |e|
      notify_error(e, e.message, :internal_server_error)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      notify_error(e, e.message, :internal_server_error)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      notify_error(e, e.message, :not_found)
    end

    private

    def notify_error(e, error, status)
      json_response({ error: }, status)
    end
  end
end
