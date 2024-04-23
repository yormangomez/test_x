class ErrorResponse {
  ErrorResponse({
    required this.defaultCode,
    required this.detail,
    required this.statusCode,
  });

  final String defaultCode;
  final String detail;
  final int statusCode;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    defaultCode: json["default_code"],
    detail: json["detail"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "default_code": defaultCode,
    "detail": detail,
    "status_code": statusCode,
  };
}