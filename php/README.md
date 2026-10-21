# Random Data Generator API - PHP Package

Random Data Generator produces mock values including names, emails, addresses, dates, and UUIDs for application testing. Specify a supported data type to receive a generated record; paid plans can generate batches up to 100 items.

## Installation

Install via Composer:

```bash
composer require apiverve/randomgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Randomgenerator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'type' => 'number',
    'count' => 1,
    'includeAvatar' => true
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Randomgenerator\Client;
use APIVerve\Randomgenerator\Exceptions\APIException;
use APIVerve\Randomgenerator\Exceptions\ValidationException;

try {
    $response = $client->execute(['type' => 'number', 'count' => 1, 'includeAvatar' => true]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "type": "phone",
    "count": 10,
    "data": [
      "967-950-4587",
      "792-611-7468 x1293",
      "(933) 311-9829",
      "389.357.7403 x793",
      "1-621-490-6394",
      "1-699-562-6833 x8558",
      "875.226.1530 x641",
      "744-991-0150 x1974",
      "1-393-784-0533 x15199",
      "954-876-6958 x0398"
    ]
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/randomgenerator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/randomgenerator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/randomgenerator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
