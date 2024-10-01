import 'package:flutter/material.dart';
import 'package:front/services/apiServices.dart';
import 'package:front/screens/Login/components/background.dart';  // Assurez-vous d'importer le Background
import 'package:front/components/rounded_button.dart';
import 'package:front/components/rounded_input_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Réinitialiser le mot de passe")),
      body: Background(  // Utilisation de Background pour un design cohérent
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedInputField(
              hintText: "Entrez l'OTP",
              icon: Icons.lock_open,
              onChanged: (value) {},
              controller: _otpController,
            ),
            RoundedInputField(
              hintText: "Entrez le nouveau mot de passe",
              icon: Icons.lock,
              onChanged: (value) {},
              controller: _passwordController,
              
            ),
            RoundedButton(
              text: "Réinitialiser le mot de passe",
              press: () async {
                bool result = await _apiService.resetPassword(_otpController.text, _passwordController.text);
                if (result) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Réinitialisation du mot de passe réussie")));
                  Navigator.pushNamed(context, '/login');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Échec de la réinitialisation du mot de passe")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
