import 'package:equatable/equatable.dart';

class BooksParams extends Equatable {
  final String queryParam;
  final int startIndex;

  const BooksParams({required this.queryParam, required this.startIndex});

  BooksParams copyWith({final String? queryParam, final int? startIndex}) {
    return BooksParams(
      queryParam: queryParam ?? this.queryParam,
      startIndex: startIndex ?? this.startIndex,
    );
  }

  @override
  List<Object?> get props => [queryParam, startIndex];
}
