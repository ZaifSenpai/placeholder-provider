class PlaceholderController < ApplicationController
  def index
    result = PlaceholderService.new(params).call

    if result[:error]
      render json: { error: result[:error] }, status: :bad_request
    else
      render plain: result[:svg], content_type: "image/svg+xml", status: result[:status]
    end
  end
end
