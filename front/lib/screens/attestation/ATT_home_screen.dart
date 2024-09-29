import 'package:flutter/material.dart';
import 'package:front/screens/attestation/background.dart';

import 'package:front/screens/attestation/body.dart';

class AttestationHomeScreen extends StatelessWidget {
  const AttestationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des Attestations"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (String value) {
              switch (value) {
                case 'Settings':
                  Navigator.pushNamed(context, '/settings');
                  break;
                case 'Historique':
                  Navigator.pushNamed(context, '/historique');
                  break;
                case 'Attestation':
                  Navigator.pushNamed(context, '/attestation');
                  break;
                case 'Log Out':
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Settings',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.settings, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Settings', style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Historique',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.history, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Historique',
                          style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Attestation',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.description, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Attestation',
                          style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Log Out',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.logout, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Log Out', style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: const Background(
        child: AttestationHomeBody(),
      ),
    );
  }
}
