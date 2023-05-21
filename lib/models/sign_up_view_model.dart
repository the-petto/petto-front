class RequestSignUpModel {
  final String username, password, nickname;

  RequestSignUpModel({
    required this.username,
    required this.password,
    required this.nickname,
  });
}

class ResponseSignUpModel {
  final bool isSuccess;
  final String message;
  final Map<String, Object> data;

  ResponseSignUpModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
}
