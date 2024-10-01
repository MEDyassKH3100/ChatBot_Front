import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Pour ouvrir le lien dans le navigateur

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageContent> {
  final List<Map<String, dynamic>> universityImages = [
    {
      "image": "assets/Esprit/img1.jpg",
      "description": "L'École supérieure privée d'ingénierie et de technologie  ou ESPRIT est une école d'ingénieurs privée de Tunisie basée à l'Ariana et agréée par le ministère de l'Enseignement supérieur et de la Recherche scientifique (agrément no2003-03). ESPRIT a également une branche école de commerce, la ESPRIT Business School.Depuis 2020, elle appartient au groupe Honoris United Universities2.En 2021, Entreprises Magazine classe ESPRIT, la première école d'ingénieurs de Tunisie3."
    },
    {
      "image": "assets/Esprit/img2.jpg",
      "description": "Description de l'image 2"
    },
    {
      "image": "assets/Esprit/img3.jpg",
      "description": "Description de l'image 3"
    },
    // Ajoutez plus d'images et descriptions selon le besoin
  ];

  void _launchURL() async {
    const url = 'https://esprit.tn';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              itemCount: universityImages.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          universityImages[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        universityImages[index]['description'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
           GestureDetector(
          onTap: _launchURL,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Visitez notre site officiel',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
