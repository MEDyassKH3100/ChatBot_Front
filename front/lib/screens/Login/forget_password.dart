import 'package:flutter/material.dart';
import 'package:front/services/apiServices.dart';
import 'package:front/screens/Login/components/background.dart';  // Assurez-vous d'importer le Background
import 'package:front/components/rounded_button.dart';
import 'package:front/components/rounded_input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mot de passe oublié")),
      body: Background(  // Utilisation de Background pour un design cohérent
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedInputField(
              hintText: "Entrez votre email",
              icon: Icons.email,
              onChanged: (value) {},
              controller: _emailController,
            ),
            RoundedButton(
              text: "Envoyer OTP",
              press: () async {
                bool result = await _apiService.forgotPassword(_emailController.text);
                if (result) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Veuillez vérifier votre email pour l'OTP")));
                  Navigator.pushNamed(context, '/resetpassword');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Échec de l'envoi de l'OTP")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
