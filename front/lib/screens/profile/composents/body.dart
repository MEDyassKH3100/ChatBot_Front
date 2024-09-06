import 'package:flutter/material.dart';
import 'package:front/screens/profile/composents/background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: size.height * 0.03),
            const ProfileTextField(
              labelText: "Nom",
              hintText: "Your Name",
              icon: Icons.person,
            ),
            const ProfileTextField(
              labelText: "Prénom",
              hintText: "Your Surname",
              icon: Icons.person_outline,
            ),
            const ProfileTextField(
              labelText: "CIN",
              hintText: "Your CIN",
              icon: Icons.badge,
            ),
            const ProfileTextField(
              labelText: "Identifiant",
              hintText: "Your ID",
              icon: Icons.credit_card,
            ),
            const ProfileTextField(
              labelText: "Email",
              hintText: "Your Email",
              icon: Icons.email,
            ),
            const ProfileTextField(
              labelText: "Mot de Passe",
              hintText: "Your Password",
              icon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: size.height * 0.05),
            ElevatedButton(
              onPressed: () {
                // Logic for saving the updated profile information
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white, // Texte en blanc
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const ProfileTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.purple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}