# Random Data Generator API - Ruby Gem

Random Data Generator produces mock values including names, emails, addresses, dates, and UUIDs for application testing. Specify a supported data type to receive a generated record; paid plans can generate batches up to 100 items.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_randomgenerator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_randomgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_randomgenerator'

# Initialize the client
client = APIVerve::Randomgenerator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  type: "number",
  count: 1,
  includeAvatar: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ type: "number", count: 1, includeAvatar: true })
  puts response["data"]
rescue APIVerve::Randomgenerator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Randomgenerator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Randomgenerator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/randomgenerator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/randomgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/randomgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
