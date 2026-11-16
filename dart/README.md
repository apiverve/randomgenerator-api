# Random Data Generator API - Dart/Flutter Client

Random Data Generator is a random data API that produces random numbers in any range (whole or decimal, with or without repeats), dice of any size, coin flips, booleans, random strings, UUIDs, and mock names, emails, addresses and dates for application testing. Numbers, dice, coins, booleans and strings come from a cryptographically secure generator. Paid plans can generate batches up to 100 items.

[![pub package](https://img.shields.io/pub/v/apiverve_randomgenerator.svg)](https://pub.dev/packages/apiverve_randomgenerator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Random Data Generator API](https://apiverve.com/marketplace/randomgenerator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_randomgenerator: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_randomgenerator/apiverve_randomgenerator.dart';

void main() async {
  final client = RandomgeneratorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'type': 'number',
      'count': 1,
      'includeAvatar': true,
      'min': 1,
      'max': 999999,
      'decimals': 2,
      'unique': true,
      'sides': 6,
      'length': 16,
      'charset': 'alphanumeric'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Random Data Generator API](https://apiverve.com/marketplace/randomgenerator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/randomgenerator](https://docs.apiverve.com/ref/randomgenerator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
