class RequestLoginModel {
  final String username, password;

  RequestLoginModel({
    required this.username,
    required this.password,
  });
}

class ResponseLoginModel {
  final bool isSuccess;
  final Map<String, Object> data;

  ResponseLoginModel({
    required this.isSuccess,
    required this.data,
  });
}
