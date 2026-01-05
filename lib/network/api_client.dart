import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_endpoints.dart';

class ApiClient {
  ApiClient({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? ApiEndpoints.baseUrl;

  final http.Client _client;
  final String baseUrl;

  Uri _buildUri(String path, [Map<String, dynamic>? query]) {
    final uri = Uri.parse(baseUrl).resolve(path);
    if (query == null || query.isEmpty) {
      return uri;
    }
    return uri.replace(
      queryParameters: query.map((key, value) => MapEntry(key, '$value')),
    );
  }

  Future<http.Response> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return _client.get(_buildUri(path, query), headers: headers);
  }

  Future<http.Response> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, dynamic>? query,
  }) {
    return _client.post(
      _buildUri(path, query),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, dynamic>? query,
  }) {
    return _client.put(
      _buildUri(path, query),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, dynamic>? query,
  }) {
    return _client.delete(
      _buildUri(path, query),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> postJson(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? query,
  }) {
    return post(
      path,
      headers: {
        'Content-Type': 'application/json',
        if (headers != null) ...headers,
      },
      body: body == null ? null : jsonEncode(body),
      query: query,
    );
  }

  void dispose() {
    _client.close();
  }
}
