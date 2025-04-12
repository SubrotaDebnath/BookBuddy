import 'package:book_buddy/core/error/failure.dart';
import 'package:book_buddy/core/use_cases/use_case.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/repositories/book_buddy_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddToFavorite extends UseCase<void, BookEntity> {
  final BookBuddyRepository bookBuddyRepository;

  AddToFavorite({required this.bookBuddyRepository});

  @override
  Future<Either<Failure, List<BookEntity>>> call({required BookEntity params}) async {
    return await bookBuddyRepository.insertFavoriteBooks(book: params) ;
  }
}
