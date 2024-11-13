import 'package:flutter/material.dart';
import 'package:front/screens/profile/composents/background.dart';
import 'package:front/services/apiServices.dart';
import 'package:front/models/user.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController cinController;
  late TextEditingController idController;
  late TextEditingController emailController;

  final ApiService apiService = ApiService();
  User? currentUser;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    cinController = TextEditingController();
    idController = TextEditingController();
    emailController = TextEditingController();
    loadUserProfile();
  }

  void loadUserProfile() async {
    currentUser = await apiService.getProfile();
    if (currentUser != null) {
      setState(() {
        nameController.text = currentUser!.nom ?? '';
        surnameController.text = currentUser!.prenom ?? '';
        cinController.text = currentUser!.cin.toString();
        idController.text = currentUser!.identifiant ?? '';
        emailController.text = currentUser!.email ?? '';
      });
    }
  }

 void updateUserProfile() async {
  // Validation du CIN pour s'assurer qu'il est numérique
  int? cinAsInt = int.tryParse(cinController.text);
  if (cinAsInt == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("CIN invalide. Veuillez entrer un nombre valide.")),
    );
    return; // Arrête l'exécution si le CIN n'est pas valide
  }

  User updatedUser = User(
    nom: nameController.text.trim(),  // Utilisez trim() pour supprimer les espaces inutiles
    prenom: surnameController.text.trim(),
    cin: cinAsInt,
    identifiant: idController.text.trim(),
    email: emailController.text.trim(),
  );

  bool result = await apiService.updateProfile(updatedUser);
  if (result) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profil mis à jour avec succès")));
    loadUserProfile();  // Recharge les données du profil
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Échec de la mise à jour du profil")));
  }
}




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
            ProfileTextField(controller: nameController, labelText: "Nom", hintText: "Your Name", icon: Icons.person),
            ProfileTextField(controller: surnameController, labelText: "Prénom", hintText: "Your Surname", icon: Icons.person_outline),
            ProfileTextField(controller: cinController, labelText: "CIN", hintText: "Your CIN", icon: Icons.badge),
            ProfileTextField(controller: idController, labelText: "Identifiant", hintText: "Your ID", icon: Icons.credit_card),
            ProfileTextField(controller: emailController, labelText: "Email", hintText: "Your Email", icon: Icons.email),
            SizedBox(height: size.height * 0.05),
            ElevatedButton(
              onPressed: updateUserProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
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

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    cinController.dispose();
    idController.dispose();
    emailController.dispose();
    super.dispose();
  }
}

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  const ProfileTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
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
