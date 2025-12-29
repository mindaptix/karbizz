import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home/all_duties_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/expenses_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/notifications/notification_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
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
      initialRoute: Routes.welcome,

      // App routes
      routes: {
        Routes.welcome: (context) => const WelcomeScreen(),
        Routes.login: (context) => const LoginScreen(),
        Routes.otp: (context) => const OtpScreen(),
        Routes.home: (context) => const HomeScreen(),
        Routes.allDuties: (context) => const AllDutiesScreen(),
        Routes.expenses: (context) => const ExpensesScreen(),
        Routes.notifications: (context) => const NotificationScreen(),
      },

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}
