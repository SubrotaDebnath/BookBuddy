import 'package:book_buddy/core/di/book_buddy_register.dart';
import 'package:book_buddy/core/di/common_register.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

init() async {
  bookBuddyRegister(sl);
  commonRegister(sl);
}