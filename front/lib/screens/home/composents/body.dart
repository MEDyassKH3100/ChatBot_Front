import 'package:flutter/material.dart';
import 'package:front/screens/home/composents/background.dart';
import 'package:front/screens/home/composents/homePageContent.dart'; // Assurez-vous que le chemin est correct

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  // Modifiez cette liste pour inclure HomePageContent pour l'index 0
   static const List<Widget> _widgetOptions = <Widget>[
    HomePageContent(), // Afficher le contenu de la page d'accueil pour l'index 0
    Text('ChatEsprit', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if( index== 0){
            Navigator.pushNamed(context, '/home');

    }

    else if (index == 2) {
      // Navigate to ProfileScreen
      Navigator.pushNamed(context, '/profile');
    } else if (index == 1) {
      // Navigate to ChatScreen
      Navigator.pushNamed(context, '/ChatEsprit');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: <Widget>[
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          BottomNavigationBar(
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
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.purple,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}