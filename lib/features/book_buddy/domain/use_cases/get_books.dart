import 'package:book_buddy/core/error/failure.dart';
import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/core/use_cases/use_case.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/repositories/book_buddy_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetBooks extends UseCase<BooksEntity, BooksParams> {
  final BookBuddyRepository bookBuddyRepository;

  GetBooks({required this.bookBuddyRepository});

  @override
  Future<Either<Failure, BooksEntity>> call({
    required BooksParams params,
  }) async => await bookBuddyRepository.getBooks(booksParams: params);
}
