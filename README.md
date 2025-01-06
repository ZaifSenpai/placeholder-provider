# Placeholder Generator API
<a href='https://placeholder-provider.onrender.com?w=150&h=120&color=%23ff0000' target="_blank"><img alt='Render' src='https://img.shields.io/badge/Example-100000?style=flat&logo=Render&logoColor=white&labelColor=black&color=FF0000'/></a>

This project provides an API to generate placeholder images with customizable dimensions and colors.

## API Endpoint

### GET /

Generates a placeholder image.

#### Parameters
| **Param**  | **Optional** | **Details**                                                                                                                                                   | **Default** |
|------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| w          | Yes          | Width of the image. Must be a non-negative number.                                                                                                            | `1`         |
| h          | Yes          | Height of the image. Must be a non-negative number.                                                                                                           | `1`         |
| color      | Yes          | Fill color of the image. Must be a valid hex color value.                                                                                                     | `#FFF`      |
| show_error | Yes          | Boolean flag to indicate whether to show errors. Setting this to `true` will return JSON object on error. `false` will return 1x1 SVG with error status code. | `false`     |
| type       | Yes          | Type of the image. Must be either `svg` or `png`.                                                                                                             | `svg`       |

#### Example Request

```sh
curl "https://placeholder-provider.onrender.com?w=100&h=100&color=%23ff0000&show_error=true"
```

#### Example Response
- On success
```xml
<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'><rect width='100' height='100' fill='#ff0000' /></svg>
```
Preview

![Preview](https://placeholder-provider.onrender.com?w=100&h=100&color=%23ff0000&show_error=true)

- On error (with `show_error=true`):
```json
{
  "error": "Width and height must be non-negative numbers"
}
```
