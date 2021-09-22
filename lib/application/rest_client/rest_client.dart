import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = RemoteConfig.instance.getString('api_base_url');
  }

  RestClient auth() {
    httpClient.addRequestModifier((Request request) {
      final apiKey = RemoteConfig.instance.getString('api_token');
      var newUrl = request.url.replace(queryParameters: {
        ...request.url.queryParameters,
        'api_key': apiKey,
        'language': 'pt-br',
      });
      return request.copyWith(url: newUrl);
    });
    return this;
  }

  RestClient noAuth() {
    httpClient.removeRequestModifier<dynamic>(_authInterceptor);
    return this;
  }

  FutureOr<Request<dynamic>> _authInterceptor(Request<dynamic> request) {
    final apiKey = RemoteConfig.instance.getString('api_token');
    var newUrl = request.url.replace(queryParameters: {
      ...request.url.queryParameters,
      'api_key': apiKey,
      'language': 'pt-br',
    });
    return request.copyWith(url: newUrl);
  }
}
