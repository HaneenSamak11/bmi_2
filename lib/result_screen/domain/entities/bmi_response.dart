class BmiResponse {
  final String status;
  final String? error;
  final BmiData data;

  BmiResponse({required this.status, this.error, required this.data});

  factory BmiResponse.fromJson(Map<String, dynamic> json) {
    return BmiResponse(
      status: json['status'] as String,
      error: json['error'] as String?,
      data: BmiData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'error': error, 'data': data.toJson()};
  }
}

class BmiData {
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;

  BmiData({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'] as String,
      weight: json['weight'] as String,
      bmi: (json['bmi'] as num).toDouble(),
      risk: json['risk'] as String,
      summary: json['summary'] as String,
      recommendation: json['recommendation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'risk': risk,
      'summary': summary,
      'recommendation': recommendation,
    };
  }
}
