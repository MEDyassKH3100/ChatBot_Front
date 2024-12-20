import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/components/already_have_an_account_check.dart';
import 'package:front/components/rounded_button.dart';
import 'package:front/components/rounded_input_field.dart';
import 'package:front/components/rounded_password_login.dart';
import 'package:front/constants.dart';
import 'package:front/screens/Login/components/background.dart';
import 'package:front/services/apiServices.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
             style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  emailController.text = value;
                });
              },
              controller: emailController,
            ),
            RoundedPasswordLogin(
              onChanged: (value) {
                setState(() {
                  passwordController.text = value;
                });
              },
              hintText: 'Password',
              isPasswordField: false,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                var user = await apiService.login(
                    emailController.text, passwordController.text);
                if (user != null) {
                  print("Connection successful, rôle: ${user.role}");
                  if (user.role == 'admin') {
                    // Rediriger vers la page d'administration
                    Navigator.pushReplacementNamed(context, '/adminScreen');
                  } else {
                    // Rediriger vers la page d'accueil utilisateur
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } else {
                  print("Échec de la connexion");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Login failed. Please check your email or password.'),
                    ),
                  );
                }
              },
            ),

            SizedBox(
              height: size.height * 0.03,
            ),

            RoundedButton(
              text: "Forgot your password?",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.pushNamed(context, '/forgotpassword');
              },
            ),

            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            // Ajout du bouton de retour à la page d'accueil
            RoundedButton(
              text: "BACK TO HOME",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
