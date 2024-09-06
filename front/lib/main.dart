import 'package:flutter/material.dart';
import 'package:front/screens/Login/login_screen.dart';
import 'package:front/screens/Signup/signup_screen.dart';
import 'package:front/screens/chat/chat_screen.dart';
import 'package:front/screens/home/home_screen.dart';
import 'package:front/screens/profile/profile_screen.dart';
import 'package:front/screens/welcome/welcome_screen.dart';
import 'package:front/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/ChatEsprit': (context) => ChatScreen(),
      },
    );
  }
}
