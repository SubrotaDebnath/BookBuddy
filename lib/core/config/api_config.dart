import 'package:flutter/foundation.dart';

const String defaultDevApiUrl = 'https://www.googleapis.com/books/v1';
const String defaultProdApiUrl = 'https://www.googleapis.com/books/v1';

String get apiUrl {
  const String environmentApiUrl = String.fromEnvironment('API_URL');
  if (environmentApiUrl.isNotEmpty) {
    return environmentApiUrl;
  } else {
    if (kDebugMode) {
      return defaultDevApiUrl;
    } else {
      return defaultProdApiUrl;
    }
  }
}
