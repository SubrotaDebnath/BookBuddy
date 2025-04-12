import 'dart:convert';

import 'package:book_buddy/core/constant/api_endpoints.dart';
import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/data/models/books_model.dart';
import 'package:http/http.dart' as http;
import 'package:book_buddy/core/error/exception.dart';

abstract class BookBuddyRemoteDataSource {
  Future<BooksModel> getBooks({required BooksParams booksParams});
}

class BookBuddyRemoteDataSourceImpl extends BookBuddyRemoteDataSource {
  final http.Client client;

  BookBuddyRemoteDataSourceImpl({required this.client});

  @override
  Future<BooksModel> getBooks({required BooksParams booksParams}) async {
    final response = await client.get(
      ApiEndpoints.getBooks(
        queryParam: booksParams.queryParam,
        startIndex: booksParams.startIndex,
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      },
    ).timeout(Duration(seconds: 5),onTimeout: (){
      return http.Response('Error timeout', 408);

    });
    
    if (response.statusCode == 200) {
      return BooksModel.fromJson(json.decode(response.body));
    }
    // else if (response.statusCode == 401) {
    //   throw UnauthorizedException();
    // } else if (response.statusCode == 400) {
    //   throw BadRequestException();
    // }
    // else if (response.statusCode == 500) {
    //   throw ServerException();
    // }
    else if(response.statusCode == 408){
      throw ConnectionTimeoutException();
    }
    else if (response.statusCode == 503) {
      throw ServiceUnavailableException();
    } else if (response.statusCode == 504) {
      throw ServerTimeoutException();
    } else {
      // throw ServerUnknownException();
      throw ServerException();
    }
  }
}
