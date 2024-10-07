import 'package:flutter/material.dart';
import 'package:front/screens/admin/body.dart';
import 'package:front/screens/attestation/background.dart';



class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des Attestations"),
        backgroundColor: Colors.purple,
        
      ),
      body:  Background(
        child: AdminBody(),
      ),
    );
  }
}
