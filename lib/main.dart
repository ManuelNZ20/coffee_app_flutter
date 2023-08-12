import 'package:coffee_app_flutter/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData(),
      home: const HomeScreen(),
    );
  }
}

