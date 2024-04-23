class ServerResponse {
  bool? isSuccess;
  String? message;
  dynamic result;
  int statusCode;

  ServerResponse({
    this.isSuccess,
    this.message,
    this.result,
    required this.statusCode
  });

  dynamic get response {
    return result;
  }
}