class PlaceholderController < ApplicationController
  def index
    result = PlaceholderService.new(params).call

    if result[:error]
      render json: { error: result[:error] }, status: :bad_request
    elsif result[:svg].present?
      render plain: result[:svg], content_type: "image/svg+xml", status: result[:status]
    else
      render plain: result[:png], content_type: "image/png", status: result[:status]
    end
  end
end
