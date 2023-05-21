class RequestLoginModel {
  final String username, password;

  RequestLoginModel({
    required this.username,
    required this.password,
  });
}

class ResponseLoginModel {
  final bool isSuccess;
  final String message;
  final Map<String, Object> data;

  ResponseLoginModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
}
