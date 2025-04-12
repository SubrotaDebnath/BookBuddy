import 'package:book_buddy/features/book_buddy/presentation/business_logic/book_buddy_bloc/book_buddy_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/favorite_book_bloc/favourite_book_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'features/book_buddy/presentation/routing/route_names.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBuddyBloc>(
          create: (BuildContext context) => sl<BookBuddyBloc>(),
        ),
        BlocProvider<FavouriteBookBloc>(
          create: (BuildContext context) => sl<FavouriteBookBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'BookBuddy',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RouteNames.kRoot,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
