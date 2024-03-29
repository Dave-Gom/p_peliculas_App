import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:p_peliculas_app/config/router/app_router.dart';
import 'package:p_peliculas_app/config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
    );
  }
}
