import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class RandomgeneratorValidationException implements Exception {
  final List<String> errors;

  RandomgeneratorValidationException(this.errors);

  @override
  String toString() => 'RandomgeneratorValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Random Data Generator API client.
///
/// For more information, visit: https://apiverve.com/marketplace/randomgenerator?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [type] - The type of random data to generate
/// * [count] - The number of random data to generate (1 to 100) [min: 1, max: 100]
/// * [includeAvatar] - Include an AI-generated face avatar (only applies when type=name)
/// * [min] - Smallest number to draw, inclusive (type=number). Defaults to 0
/// * [max] - Largest number to draw, inclusive (type=number). Defaults to 999999
/// * [decimals] - Decimal places for type=number (0 to 10); 0 draws whole numbers [min: 0, max: 10]
/// * [unique] - Draw without repeats (type=number with whole numbers, or type=dice)
/// * [sides] - Number of sides on each die for type=dice (2 to 1000) [min: 2, max: 1000]
/// * [length] - Length of each value for type=string (1 to 256) [min: 1, max: 256]
/// * [charset] - Characters for type=string
class RandomgeneratorClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'type': ValidationRule(type: 'string', required: false),
    'count': ValidationRule(type: 'integer', required: false, min: 1, max: 100),
    'includeAvatar': ValidationRule(type: 'boolean', required: false),
    'min': ValidationRule(type: 'number', required: false),
    'max': ValidationRule(type: 'number', required: false),
    'decimals': ValidationRule(type: 'integer', required: false, min: 0, max: 10),
    'unique': ValidationRule(type: 'boolean', required: false),
    'sides': ValidationRule(type: 'integer', required: false, min: 2, max: 1000),
    'length': ValidationRule(type: 'integer', required: false, min: 1, max: 256),
    'charset': ValidationRule(type: 'string', required: false),
  };

  RandomgeneratorClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/randomgenerator',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [RandomgeneratorValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw RandomgeneratorValidationException(errors);
    }
  }

  /// Execute a request to the Random Data Generator API.
  ///
  /// Parameters are validated before sending the request.
  Future<RandomgeneratorResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw RandomgeneratorException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return RandomgeneratorResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw RandomgeneratorException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw RandomgeneratorException('Resource not found');
      } else {
        throw RandomgeneratorException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is RandomgeneratorException) rethrow;
      throw RandomgeneratorException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Random Data Generator API client.
class RandomgeneratorException implements Exception {
  final String message;

  RandomgeneratorException(this.message);

  @override
  String toString() => 'RandomgeneratorException: $message';
}
