import 'package:flutter/material.dart';
import 'package:front/screens/admin/body.dart';
import 'package:front/screens/attestation/background.dart';



class AttestationScreen extends StatelessWidget {
  const AttestationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Espace Admin"),
        backgroundColor: Colors.purple,
        
      ),
      body:  Background(
        child: AdminBody(),
      ),
    );
  }
}
