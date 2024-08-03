import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/components/already_have_an_account_check.dart';
import 'package:front/components/rounded_button.dart';
import 'package:front/components/rounded_input_field.dart';
import 'package:front/components/rounded_password_field.dart';
import 'package:front/constants.dart';
import 'package:front/screens/Signup/components/background.dart';
import 'package:front/screens/Login/login_screen.dart';

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
            "SIGNUP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
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
          ),
          RoundedButton(
            text: "SIGNUP",
            press: () {},
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
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
