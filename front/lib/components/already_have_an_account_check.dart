import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: login ? "Don't have an Account ? " : "Already have an Account ? ",
              style: const TextStyle(color: kPrimaryColor),
            ),
            TextSpan(
              text: login ? "Sign Up" : "Sign In",
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => press(),
            ),
          ],
        ),
      ),
    );
  }
}
