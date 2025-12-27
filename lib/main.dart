import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'routes/routes.dart';

void main() {
  runApp(const KarbizzApp());
}

class KarbizzApp extends StatelessWidget {
  const KarbizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karbizz',
      debugShowCheckedModeBanner: false,

      // Initial screen
      initialRoute: Routes.splash,

      // App routes
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.login: (context) => const LoginScreen(),
      },

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}