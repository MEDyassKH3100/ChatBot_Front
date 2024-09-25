import 'package:flutter/material.dart';
import 'package:flutter_gemini_bot/flutter_gemini_bot.dart';
import 'package:flutter_gemini_bot/models/chat_model.dart';
import 'background.dart';
 // Import ChatScreen

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 1;

 

  void onTap(int index) {
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
  }
  List<ChatModel> chatList = []; // Your list of ChatModel objects
  String apiKey = 'AIzaSyDLYEYXcKak7fJO5_Eu8pCg95AsHJasCec';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
           Expanded(
             child: FlutterGeminiChat(
                     chatContext: 'you are a chat bot for a eng school named esprit in tunisia so you will help students and you can reply on english or on frensh',
                     chatList: chatList,
                     apiKey: apiKey,
                   ),
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
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
