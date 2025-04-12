import 'package:book_buddy/app.dart';
import 'package:book_buddy/core/db/book_buddy_db.dart';
import 'package:flutter/material.dart';
import 'package:book_buddy/core/di/injection_container.dart' as di;

initializeLocalDB() async {
  await di.sl<BookDatabase>().initHive();
  // WidgetsFlutterBinding.ensureInitialized();

  // await BookDatabase().initHive();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Service Locator initialization
  await di.init();
  // Database Initialization
  // await initializeLocalDB();
  await di.sl<BookDatabase>().initHive();


  runApp(const App());
}
