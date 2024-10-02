import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageContent> {
  final List<Map<String, dynamic>> universityImages = [
    {
      "image": "assets/Esprit/img1.jpg",
      "description": "L'École supérieure privée d'ingénierie et de technologie ou ESPRIT est une école d'ingénieurs privée de Tunisie basée à l'Ariana et agréée par le ministère de l'Enseignement supérieur et de la Recherche scientifique."
    },
    {"image": "assets/Esprit/img2.jpg", "description": "Description de l'image 2"},
    {"image": "assets/Esprit/img3.jpg", "description": "Description de l'image 3"},
  ];

  void _launchURL() async {
    final url = Uri.parse('https://esprit.tn');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/Esprit/ChatEsprit.png', height: 50),
              Image.asset('assets/Esprit/logo.png', height: 50),
            ],
          ),
        ),
        Text(
          "Bienvenue sur l'application officielle de l'ESPRIT",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        Expanded(
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return ListView.builder(
                controller: scrollController,
                itemCount: universityImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(universityImages[index]['image'], fit: BoxFit.cover),
                        Text(universityImages[index]['description'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            initialChildSize: 0.5,
            minChildSize: 0.25,
            maxChildSize: 0.75,
          ),
        ),
      ],
    ),
  );
}
}