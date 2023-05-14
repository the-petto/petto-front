class RequestLoginDto {
  final String username, password;

  RequestLoginDto({
    required this.username,
    required this.password,
  });
}

class ResponseLoginDto {
  final bool isSuccess;
  final Map<String, Object> data;

  ResponseLoginDto({
    required this.isSuccess,
    required this.data,
  });
}
