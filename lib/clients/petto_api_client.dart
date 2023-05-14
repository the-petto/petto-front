import 'dart:convert';

import 'package:http/http.dart' as http;

class PettoApiClient {
  static const String baseUrl = "http://192.168.0.36:8080";
  static const headers = {
    'Content-Type': 'application/json',
  };

  PettoApiClient._privateConstructor();
  static final PettoApiClient _instance = PettoApiClient._privateConstructor();

  factory PettoApiClient() {
    return _instance;
  }
}
