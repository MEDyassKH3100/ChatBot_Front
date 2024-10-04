import 'package:flutter/material.dart';

class AttestationHomeBody extends StatelessWidget {
  const AttestationHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AttestationButton(
            text: " Attestation du Stage ",
            icon: Icons.add,
            onPressed: () {
              Navigator.pushNamed(context, '/Attestation_stage');
            },
          ),
          const SizedBox(height: 20),
          AttestationButton(
            text: "Réclamer",
            icon: Icons.search,
            onPressed: () {
              Navigator.pushNamed(context, '/reclamation');
            },
          ),
        ],
      ),
    );
  }
}

class AttestationButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AttestationButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.purple,
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
    );
  }
}
