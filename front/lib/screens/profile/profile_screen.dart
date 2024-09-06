import 'package:flutter/material.dart';
import 'package:front/screens/profile/composents/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' PROFILE ',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
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
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'ChatEsprit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Set to profile index
        selectedItemColor: Colors.purple,
        onTap: (index) {
          // Navigate to the respective page based on the index
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(
                context, '/ChatEsprit'); // Navigate to ChatScreen
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
