import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/favourites_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  await Hive.initFlutter();

 
  await Hive.openBox<String>('favoritesBox');
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Webtoon Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final title = state.uri.queryParameters['title'] ?? '';
            final genre = state.uri.queryParameters['genre'] ?? '';
            final image = state.uri.queryParameters['image'] ?? '';
            final creator = state.uri.queryParameters['creator'] ?? '';
            final description = state.uri.queryParameters['description'] ?? '';
             final initialRating = double.tryParse(state.uri.queryParameters['initialRating'] ?? '0') ?? 0.0;
           
            return DetailScreen(
              title: title,
              genre: genre,
              image: image,
              description: description,
              creator: creator,
              initialRating:initialRating, onRatingUpdate: (double value) {  },
             
            );
          },
        ),
        GoRoute(
          path: 'favourites',
          builder: (BuildContext context, GoRouterState state) {
            return const FavoritesScreen();
          },
        ),
      ],
    ),
  ],
);