Random Data Generator API
============

Random Data Generator produces random numbers in any range (whole or decimal, with or without repeats), dice of any size, coin flips, booleans, random strings, UUIDs, and mock names, emails, addresses and dates for application testing. Numbers, dice, coins, booleans and strings come from a cryptographically secure generator. Paid plans can generate batches up to 100 items.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-randomdatagenerator.svg)](https://pypi.org/project/apiverve-randomdatagenerator/)

This is a Python wrapper for the [Random Data Generator API](https://apiverve.com/marketplace/randomgenerator?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-randomdatagenerator
```

Using `pip3`:

```bash
pip3 install apiverve-randomdatagenerator
```

---

## Configuration

Before using the Random Data Generator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = RandomgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Random Data Generator API documentation is found here: [https://docs.apiverve.com/ref/randomgenerator](https://docs.apiverve.com/ref/randomgenerator?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = RandomgeneratorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `RandomgeneratorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient, RandomgeneratorAPIClientError

api = RandomgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except RandomgeneratorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient, RandomgeneratorAPIClientError

api = RandomgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except RandomgeneratorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient, RandomgeneratorAPIClientError

query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}

# Using context manager ensures proper cleanup
with RandomgeneratorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except RandomgeneratorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient

# Enable debug mode
api = RandomgeneratorAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_randomdatagenerator.apiClient import RandomgeneratorAPIClient

api = RandomgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "type": "number",
    "count": 1,
    "includeAvatar": true,
    "min": 1,
    "max": 999999,
    "decimals": 2,
    "unique": true,
    "sides": 6,
    "length": 16,
    "charset": "alphanumeric"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
