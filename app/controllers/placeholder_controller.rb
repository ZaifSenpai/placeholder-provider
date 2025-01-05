class PlaceholderController < ApplicationController
  def index
    svg_content = '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"><circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" /></svg>'
    render plain: svg_content, content_type: "image/svg+xml", status: :ok
  end
end
