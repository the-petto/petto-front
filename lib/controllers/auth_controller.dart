import 'package:petto_mobile/models/sign_up_view_model.dart';
import 'package:petto_mobile/services/auth_service.dart';
import 'package:petto_mobile/models/login_view_model.dart';
import 'package:petto_mobile/services/dtos/auth_dto.dart';

class AuthController {
  AuthService authService = AuthService();

  AuthController._privateConstructor();
  static final AuthController _instance = AuthController._privateConstructor();

  factory AuthController() {
    return _instance;
  }

  Future<ResponseLoginModel> login(RequestLoginModel model) async {
    final responseDto = await authService.login(RequestLoginDto(
      username: model.username,
      password: model.password,
    ));

    return ResponseLoginModel(
      isSuccess: responseDto.isSuccess,
      message: responseDto.message,
      data: responseDto.data,
    );
  }

  Future<ResponseSignUpModel> signUp(RequestSignUpModel model) async {
    final responseDto = await authService.signUp(RequestSignUpDto(
      username: model.username,
      password: model.password,
      nickname: model.nickname,
    ));

    return ResponseSignUpModel(
      isSuccess: responseDto.isSuccess,
      message: responseDto.message,
      data: responseDto.data,
    );
  }
}
