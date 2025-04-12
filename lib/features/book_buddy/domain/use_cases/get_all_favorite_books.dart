import 'package:book_buddy/core/error/failure.dart';
import 'package:book_buddy/core/params/empty_params.dart';
import 'package:book_buddy/core/use_cases/use_case.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/repositories/book_buddy_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllFavoriteBooks extends UseCase<List<BookEntity>, EmptyParams> {
  final BookBuddyRepository bookBuddyRepository;

  GetAllFavoriteBooks({required this.bookBuddyRepository});

  @override
  Future<Either<Failure, List<BookEntity>>> call({
    required EmptyParams params,
  }) async {
    return await bookBuddyRepository.getAllFavoriteBooks();
  }
}
