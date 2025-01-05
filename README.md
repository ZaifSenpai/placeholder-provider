# Placeholder SVG Generator API
<a href='https://placeholder-provider.onrender.com/placeholder?w=150&h=120&color=red' target="_blank"><img alt='Render' src='https://img.shields.io/badge/Demo-100000?style=flat&logo=Render&logoColor=white&labelColor=black&color=FF0000'/></a>

This project provides an API to generate placeholder SVG images with customizable dimensions and colors.

## API Endpoint

### GET /placeholder

Generates a placeholder SVG image.

#### Parameters

- `w` (optional): Width of the SVG. Must be a non-negative number. Default is `1`.
- `h` (optional): Height of the SVG. Must be a non-negative number. Default is `1`.
- `color` (optional): Fill color of the SVG. Must be a valid hex color code or svg color value. Default is `white`.
- `show_error` (optional): Boolean flag to indicate whether to show errors. Setting this to `true` will return JSON object on error. `false` will return 1x1 SVG with error status code. Default is `false`.

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
