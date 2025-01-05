class PlaceholderService
  def initialize(params)
    @color = params[:color] || "white"
    @w = params[:w] || "1"
    @h = params[:h] || "1"
    @show_error = params[:show_error].present? ? params[:show_error] == "true" : false
  end

  def call
    error1 = "Width and height must be non-negative numbers" unless valid_number?(@w) && valid_number?(@h)
    error2 = "Invalid color format" unless valid_color?(@color)

    if error1 || error2
      return { error: error1 || error2 } if @show_error

      # Default values
      @w = @h = 1
      @color = "white"
    end

    status = error1 || error2 ? :bad_request : :ok

    { svg: generate_svg, status: status }
  end

  private

  def valid_number?(value)
    value.to_s.match?(/\A\d+\z/)
  end

  def valid_color?(value)
    value.match?(/\A#?\w+\z/)
  end

  def generate_svg
    "<svg xmlns='http://www.w3.org/2000/svg' width='#{@w}' height='#{@h}'><rect width='#{@w}' height='#{@h}' fill='#{@color}' /></svg>"
  end
end
