import 'package:flutter/material.dart';

class EmailVerificationSuccess extends StatelessWidget {
  const EmailVerificationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vérification de l\'email réussie'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Votre e-mail a été vérifié avec succès!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Aller à la connexion'),
            ),
          ],
        ),
      ),
    );
  }
}
