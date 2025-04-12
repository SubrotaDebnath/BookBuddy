class ApiEndpoints {
  // Dev
  static const String _baseUrl = 'https://www.googleapis.com/books/v1';

  // Prod
  // static const String _baseUrl = 'https://www.example.com/books/v1';

  static Uri _createUri(String path) {
    return Uri.parse(_baseUrl + path);
  }

  static Uri getBooks({required String queryParam, required int startIndex}) =>
      _createUri('/volumes?q=$queryParam&startIndex=$startIndex&maxResult=10');
}
