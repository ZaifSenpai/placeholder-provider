# Placeholder Generator API

This project provides an API to generate placeholder images with customizable dimensions and colors.

## API Endpoint

### GET /placeholder

Generates a placeholder image.

#### Parameters

- `w` (optional): Width of the image. Must be a non-negative number. Default is `1`.
- `h` (optional): Height of the image. Must be a non-negative number. Default is `1`.
- `color` (optional): Fill color of the image. Must be a valid hex color code. Default is `#FFF`.
- `show_error` (optional): Boolean flag to indicate whether to show errors. Setting this to `true` will return JSON object on error. `false` will return 1x1 SVG with error status code. Default is `false`.
- `type` (optional): Type of the image. Must be either `svg` or `png`. Default is `svg`.

#### Example Request

```sh
curl "http://localhost:3000/placeholder?w=100&h=100&color=%23ff0000&show_error=true"
```

#### Example Response
- On success
```xml
<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'><rect width='100' height='100' fill='#ff0000' /></svg>
```
- On error (with `show_error=true`):
```json
{
  "error": "Width and height must be non-negative numbers"
}
```
