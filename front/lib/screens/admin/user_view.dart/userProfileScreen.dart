import 'package:flutter/material.dart';
import 'package:front/services/adminServices.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;
  final AdminServices adminServices = AdminServices();

  UserProfileScreen({super.key, required this.userId});

  void banUser(BuildContext context) async {
    bool result = await adminServices.banUser(userId);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Utilisateur banni avec succès.')));
      Navigator.pop(context);  // Optionnel: retour automatique après bannissement
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Échec du bannissement de l\'utilisateur')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil de l\'utilisateur'),
        actions: [
          IconButton(
            icon: Icon(Icons.block),
            onPressed: () => banUser(context),
          ),
        ],
      ),
      body: Center(
        child: Text('Détails de l\'utilisateur pour $userId'),
      ),
    );
  }
}
