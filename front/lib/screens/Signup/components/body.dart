import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/components/already_have_an_account_check.dart';
import 'package:front/components/rounded_button.dart';
import 'package:front/components/rounded_input_field.dart';
import 'package:front/components/rounded_password_field.dart';
import 'package:front/screens/Signup/components/background.dart';
import 'package:front/services/apiServices.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController identifiantController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Nom",
              onChanged: (value) {
                setState(() {
                  nomController.text = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Prénom",
              onChanged: (value) {
                setState(() {
                  prenomController.text = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "CIN",
              onChanged: (value) {
                setState(() {
                  cinController.text = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Identifiant",
              onChanged: (value) {
                setState(() {
                  identifiantController.text = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                setState(() {
                  emailController.text = value;
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  passwordController.text = value;
                });
              },
              hintText: 'Password',
              isPasswordField: false,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                bool success = await apiService.register(
                  emailController.text,
                  passwordController.text,
                  nomController.text,
                  prenomController.text,
                  int.parse(cinController.text),
                  identifiantController.text,
                );

                if (success) {
                  // Redirige vers l'écran de succès d'inscription
                  Navigator.pushNamed(context, '/signupSuccess');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Inscription échouée.')),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text("BACK TO HOME"),
            ),
          ],
        ),
      ),
    );
  }
}
