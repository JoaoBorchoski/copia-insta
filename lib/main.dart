import 'package:copia_insta_tent1/presentation/providers/posts_provider.dart';
import 'package:copia_insta_tent1/presentation/providers/user_provider.dart';
import 'package:copia_insta_tent1/routes/app_route.dart';
import 'package:copia_insta_tent1/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Users()),
          ChangeNotifierProvider(create: (_) => Posts()),
        ],
        child: MaterialApp(
          title: 'Copia Insta',
          theme: AppThemes.mainTheme,
          routes: appRoutes,
        ));
  }
}
