import 'dart:convert';

import 'package:petto_mobile/clients/petto_api_client.dart';
import 'package:petto_mobile/services/dtos/auth_dto.dart';

class AuthService {
  PettoApiClient pettoApiClient = PettoApiClient();

  AuthService._privateConstructor();
  static final AuthService _instance = AuthService._privateConstructor();

  factory AuthService() {
    return _instance;
  }

  Future<ResponseLoginDto> login(RequestLoginDto loginDto) async {
    try {
      final response =
          await pettoApiClient.login(loginDto.username, loginDto.password);
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return ResponseLoginDto(
            isSuccess: true,
            message: responseData['message'],
            data: {
              "accessToken": responseData['data']['accessToken'],
              "refreshToken": responseData['data']['refreshToken'],
            });
      } else {
        return ResponseLoginDto(
            isSuccess: false, message: responseData['message'], data: {});
      }
    } catch (e) {
      return ResponseLoginDto(isSuccess: false, message: "error", data: {});
    }
  }

  Future<ResponseSignUpDto> signUp(RequestSignUpDto signUpDto) async {
    try {
      final response = await pettoApiClient.signUp(
        signUpDto.username,
        signUpDto.password,
        signUpDto.nickname,
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return ResponseSignUpDto(
            isSuccess: true,
            message: responseData['message'],
            data: {"username": responseData['data']['username']});
      } else {
        return ResponseSignUpDto(
            isSuccess: false, message: responseData['message'], data: {});
      }
    } catch (e) {
      return ResponseSignUpDto(isSuccess: false, message: "error", data: {});
    }
  }
}
