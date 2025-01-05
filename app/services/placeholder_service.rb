require "chunky_png"

class PlaceholderService
  def initialize(params)
    @color = params[:color] || "#FFF"
    @w = params[:w] || "1"
    @h = params[:h] || "1"
    @show_error = params[:show_error].present? ? params[:show_error] == "true" : false
    @type = params[:type] || "svg"
  end

  def call
    error1 = "Width and height must be non-negative numbers" unless valid_number?(@w) && valid_number?(@h)
    error2 = "Invalid color format. Must be HEX color example: #FF0000" unless valid_color?(@color)
    error3 = "type must be 'png' or 'svg'" unless valid_type?(@type)

    if error1 || error2 || error3
      return { error: error1 || error2 || error3 } if @show_error

      # Default values
      @w = @h = 1
      @color = "#FFF"
      @type = "svg"
    end

    status = error1 || error2 || error3 ? :bad_request : :ok

    if @type == "png"
      { png: generate_png, status: status }
    else
      { svg: generate_svg, status: status }
    end
  end

  private

  def valid_number?(value)
    value.to_s.match?(/\A\d+\z/)
  end

  def valid_color?(value)
    value.match?(/\A#([A-Fa-f0-9]{3}){1,2}\z/)
  end

  def valid_type?(value)
    value == "svg" || value == "png"
  end

  def generate_svg
    "<svg xmlns='http://www.w3.org/2000/svg' width='#{@w}' height='#{@h}'><rect width='#{@w}' height='#{@h}' fill='#{@color}' /></svg>"
  end

  def generate_png
    width = @w.to_i
    height = @h.to_i

    png = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
    color = ChunkyPNG::Color.from_hex(@color)

    width.times do |x|
      height.times do |y|
        png[x, y] = color
      end
    end

    png.to_blob
  end
end
