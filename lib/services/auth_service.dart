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

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return ResponseLoginDto(isSuccess: true, data: {"accessToken": "aaaa"});
      } else {
        return ResponseLoginDto(
            isSuccess: false,
            data: {"message": jsonDecode(response.body).message});
      }
    } catch (e) {
      return ResponseLoginDto(
          isSuccess: false, data: {"message": e.toString()});
    }
  }
}
