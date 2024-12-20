import 'package:flutter/material.dart';
import 'package:front/screens/Login/forget_password.dart';
import 'package:front/screens/Login/login_screen.dart';
import 'package:front/screens/Login/reset_password.dart';
import 'package:front/screens/Signup/email_verification_success.dart';
import 'package:front/screens/Signup/signup_screen.dart';
import 'package:front/screens/Signup/signup_success_screen.dart';
import 'package:front/screens/admin/adminScreen.dart';
import 'package:front/screens/attestation/ATT_home_screen.dart';
import 'package:front/screens/attestation/reclamation/Reclamation_screen.dart';
import 'package:front/screens/attestation/stage/AT_stage_screen.dart';
import 'package:front/screens/chat/chat_screen.dart';
import 'package:front/screens/historique/historiqueScreen.dart';
import 'package:front/screens/home/home_screen.dart';
import 'package:front/constants.dart';
import 'package:front/screens/profile/profile_screen.dart';
import 'package:front/screens/welcome/welcome_screen.dart';

import 'screens/admin/attestation_view.dart/attestationScreen.dart';
import 'screens/admin/user_view.dart/userProfileScreen.dart';


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
        '/signupSuccess': (context) => const SignupSuccessScreen(),
        '/emailVerificationSuccess': (context) =>
            const EmailVerificationSuccess(),
        '/home': (context) => const HomeScreen(),
        '/ChatEsprit': (context) => const ChatScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/attestation': (context) => const AttestationHomeScreen(),
        '/forgotpassword': (context) => const ForgotPasswordScreen(),
        '/resetpassword': (context) => const ResetPasswordScreen(),
        '/reclamation': (context) => const ReclamationScreen(),
        '/Attestation_stage': (context) => const ATStageScreen(),
        '/historique': (context) => const Historiquescreen(),
        '/adminScreen': (context) => const AdminScreen(),
        
        '/attestationScreen': (context) => AttestationScreen(),
        
        '/userProfileScreen': (context) => UserProfileScreen(userId: '',),
      
      },
    );
  }
}


// mohamedyassine.khlaf@esprit.tn  
// Test*123