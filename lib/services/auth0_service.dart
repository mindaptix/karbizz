import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:http/http.dart' as http;

class Auth0Service {
  Auth0Service({
    Auth0? auth0,
    http.Client? client,
  })  : _auth0 = auth0 ?? Auth0(_domain, _clientId),
        _client = client ?? http.Client();

  static const String _domain = String.fromEnvironment(
    'AUTH0_DOMAIN',
    defaultValue: 'YOUR_AUTH0_DOMAIN',
  );
  static const String _clientId = String.fromEnvironment(
    'AUTH0_CLIENT_ID',
    defaultValue: 'YOUR_AUTH0_CLIENT_ID',
  );

  final Auth0 _auth0;
  final http.Client _client;

  Future<void> sendOtp({required String phoneNumber}) async {
    final uri = Uri.https(_domain, '/passwordless/start');
    final response = await _client.post(
      uri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode({
        'client_id': _clientId,
        'connection': 'sms',
        'phone_number': phoneNumber,
        'send': 'code',
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Auth0Exception(
        'Failed to send OTP',
        code: 'otp_send_failed',
        message: response.body,
      );
    }
  }

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final uri = Uri.https(_domain, '/oauth/token');
    final response = await _client.post(
      uri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode({
        'grant_type': 'http://auth0.com/oauth/grant-type/passwordless/otp',
        'client_id': _clientId,
        'username': phoneNumber,
        'otp': otp,
        'realm': 'sms',
        'scope': 'openid profile email offline_access',
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Auth0Exception(
        'Failed to verify OTP',
        code: 'otp_verify_failed',
        message: response.body,
      );
    }
  }
}
