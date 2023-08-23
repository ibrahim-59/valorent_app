import 'package:flutter/material.dart';
import 'package:valorent_app/view/screens/splash_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorent App',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffBD3944)),
      home: const SplashViewBody(),
    );
  }
}
