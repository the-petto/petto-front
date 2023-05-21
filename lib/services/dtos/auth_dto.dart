class RequestLoginDto {
  final String username, password;

  RequestLoginDto({
    required this.username,
    required this.password,
  });
}

class ResponseLoginDto {
  final bool isSuccess;
  final String message;
  final Map<String, Object> data;

  ResponseLoginDto({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
}

class RequestSignUpDto {
  final String username, password, nickname;

  RequestSignUpDto({
    required this.username,
    required this.password,
    required this.nickname,
  });
}

class ResponseSignUpDto {
  final bool isSuccess;
  final String message;
  final Map<String, Object> data;

  ResponseSignUpDto({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
}
