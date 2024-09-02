import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/components/already_have_an_account_check.dart';
import 'package:front/components/rounded_button.dart';
import 'package:front/components/rounded_input_field.dart';
import 'package:front/components/rounded_password_field.dart';
import 'package:front/constants.dart';
import 'package:front/screens/Login/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
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
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: 'Password',
            isPasswordField: false,
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {
              // Logique de connexion ici (vérifiez les informations de l'utilisateur)

              // Si la connexion est réussie, redirigez vers la HomeScreen
              Navigator.pushNamed(context, '/home');
            },
          ),
          SizedBox(
            height: size.height * 0.03,
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
    );
  }
}
