/// Response models for the Random Data Generator API.

/// API Response wrapper.
class RandomgeneratorResponse {
  final String status;
  final dynamic error;
  final RandomgeneratorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  RandomgeneratorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory RandomgeneratorResponse.fromJson(Map<String, dynamic> json) => RandomgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? RandomgeneratorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Random Data Generator API.

class RandomgeneratorData {
  String? type;
  num? count;
  List<String>? data;

  RandomgeneratorData({
    this.type,
    this.count,
    this.data,
  });

  factory RandomgeneratorData.fromJson(Map<String, dynamic> json) => RandomgeneratorData(
      type: json['type'],
      count: json['count'],
      data: (json['data'] as List?)?.cast<String>(),
    );
}

class RandomgeneratorRequest {
  String? type;
  int? count;
  bool? includeAvatar;
  double? min;
  double? max;
  int? decimals;
  bool? unique;
  int? sides;
  int? length;
  String? charset;

  RandomgeneratorRequest({
    this.type,
    this.count,
    this.includeAvatar,
    this.min,
    this.max,
    this.decimals,
    this.unique,
    this.sides,
    this.length,
    this.charset,
  });

  Map<String, dynamic> toJson() => {
      if (type != null) 'type': type,
      if (count != null) 'count': count,
      if (includeAvatar != null) 'includeAvatar': includeAvatar,
      if (min != null) 'min': min,
      if (max != null) 'max': max,
      if (decimals != null) 'decimals': decimals,
      if (unique != null) 'unique': unique,
      if (sides != null) 'sides': sides,
      if (length != null) 'length': length,
      if (charset != null) 'charset': charset,
    };
}
